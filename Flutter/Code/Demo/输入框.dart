import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = new TextEditingController();
 
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
              TextField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或者邮箱',
                  prefixIcon: Icon(Icons.person),
                ),
                controller: _controller,
              ),
              TextField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '******',
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (value) => print(value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}