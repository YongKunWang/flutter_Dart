import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linear Progress Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Linear Progress Demo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              /// 循环模式
              LinearProgressIndicator(),
              /// 精确模式
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                value: 0.6,
              ),
              ///
              CircularProgressIndicator(),
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                value: .2,
              ),
              SizedBox(
                height: 10.0,
                width: 300.0,
                child: LinearProgressIndicator(),
              ),
              SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}