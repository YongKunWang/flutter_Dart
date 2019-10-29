import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _password;
  String _userName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linear Progress Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Linear Progress Demo'),
        ),
        body: Container(
          color: Colors.green,
          child: Column(
            //左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('Hello World'),
                    Text('Hello Flutter'),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}