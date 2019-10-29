import 'package:mqtt_client/mqtt_client.dart' ;
import './MyBuff.dart';
class AppMqttTransactions{
  AppMqttTransactions(){
  }
  MqttClient client;
  String previousTopic;
  bool bAlreadySubscribed = false;

  Future<bool> subscribe(String topic) async {
    if(await _connectToClient() == true){
      client.onDisconnected = _onDisconnected;
      client.onConnected = _onConnected;
      client.onSubscribed = _onSubscribed;
      _subscribe(topic);
    }
    return true;
  }

  Future<bool> _connectToClient() async{
    if(client != null &&
       client.connectionStatus.state == MqttConnectionState.connected){
         print('already logged in');
       }else {
          client = await _login();
          if(client == null){
            return false;
          }
       }
    return true;
  }
  Future<MqttClient> _login() async{

    client = MqttClient('49.235.208.126','Android_IOT');
    client.logging(on:true);
    final MqttConnectMessage connMsg = MqttConnectMessage()
          .withClientIdentifier('Android_IOT')
          .keepAliveFor(60)
          .withWillTopic('willTopic')
          .withWillMessage('My Will message')
          .startClean()
          .withWillQos(MqttQos.atMostOnce);
    print('Mqtt Client connecting......');
    client.connectionMessage = connMsg;
    try{
      await client.connect();
    } on Exception catch(e){
      print('EXCEPTION:client exception -$e');
      client.disconnect();
      client = null;
      return client;
    }

    if(client.connectionStatus.state == MqttConnectionState.connected){
      print('client connected');
      print("-------------------------------");
    }else{
      print(
        'client connection failed - disconnecting, status is ${client.connectionStatus} '
      );
      client.disconnect();
      client = null;
    }
    return client;
  }
  void _onDisconnected() {
    print('OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus.returnCode == MqttConnectReturnCode.solicited) {
      print(':OnDisconnected callback is solicited, this is correct');
    }
    client.disconnect();
  }
  void _onConnected() {
    print('OnConnected client callback - Client connection was sucessful');
  }
  void _onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
    this.bAlreadySubscribed = true;
    this.previousTopic = topic;
  }

  Future _subscribe(String topic) async{
    if(this.bAlreadySubscribed == true){
      client.unsubscribe(this.previousTopic);
    }
    print('Subscribing to the topic $topic');
    client.subscribe(topic, MqttQos.atMostOnce);
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c){
      final MqttPublishMessage recMess = c[0].payload;
      final String pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print(
        'Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->'
      );
      MyBuff.add(pt);
      return pt;
    });
  }

  Future<void> publish(String topic, String value) async{
    if(await _connectToClient() == true){
      final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
      builder.addString(value);
      client.publishMessage(topic, MqttQos.atMostOnce, builder.payload);
    }
  }

}