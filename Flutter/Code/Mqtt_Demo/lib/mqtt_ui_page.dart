import 'package:flutter/material.dart';
import './mqtt_stream.dart';
import './MyBuff.dart';

class MqttPage extends StatefulWidget {
  MqttPage({this.title});
  final String title;
  @override
  _MqttPageState createState() => _MqttPageState();
}

class _MqttPageState extends State<MqttPage> {
  AppMqttTransactions myMqtt = AppMqttTransactions();
  final myTopicController = TextEditingController();
  final myValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
      //防止软键盘弹出，顶掉内容
      resizeToAvoidBottomPadding: false, 
    );
  }
  Widget _body(){
    return Column(
      children: <Widget>[
        _subscriptionInfo(),
        _subscriptionData(),
        _publishInfo(),
      ],
    );
  }
  Widget _subscriptionInfo(){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: myTopicController,
                  decoration: InputDecoration(
                    labelText: 'Topic',
                    border: OutlineInputBorder(),
                    hintText: 'Enter topic to subscribe to',
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Subscribe'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: ()=>subscribe(myTopicController.text),
          ),
        ],
      ),
    );
  }
  void subscribe(String topic){
    myMqtt.subscribe(topic);
  }

  Widget _subscriptionData() {
    return StreamBuilder(
      stream:MyBuff.DateStream,
      builder: (context,snapshot){
        String reading = snapshot.data;
        if(reading == null)
          reading = 'No value is available';
        return Text(reading);
      }
    );
  }


  Widget _publishInfo(){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: myValueController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Value',
                    hintText: 'Enter value to publish',
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Publish'),
            onPressed: ()=> publish(myTopicController.text, myValueController.text),
          ),
        ],
      ),
    );
  }
 // Widget _publishInfo(){
    
  //   return Container(
  //     margin: EdgeInsets.all(20.0),
  //     child: Column(
  //       children: <Widget>[
  //         Flexible(
  //           child: TextField(
  //             controller: myValueController,
  //             decoration: InputDecoration(
  //               border: OutlineInputBorder(),
  //               labelText: 'Value',
  //               hintText: 'Enter value to publish',
  //             ),
  //           ),
  //         ),
  //         RaisedButton(
  //           color: Colors.blue,
  //           textColor: Colors.white,
  //           child: Text('Publish'),
  //           onPressed: ()=> publish(myTopicController.text, myValueController.text),
  //         ),
  //       ],
  //     ),
  //   );
  // }
 

  void publish(String topic, String value){
    myMqtt.publish(topic, value);
  }


}