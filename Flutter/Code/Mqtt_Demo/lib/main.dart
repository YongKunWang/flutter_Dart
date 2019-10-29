import 'package:flutter/material.dart';
import './mqtt_ui_page.dart';

void main()
{
  return runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '泛在电力物联网客户端',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: MqttPage(title:'MQTT Learning'),
    );
  }
}
  



