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
        body: Center(
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: false,
                  controller: _controller1,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: '用户名或者邮箱',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v){
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                   onSaved: (value){
                    _userName = value;
                  },
                ),
                TextFormField(
                  autofocus: false,
                  controller: _controller2,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: '******',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (v){
                    return v.trim().length > 0 ? null : "密码不能为空";
                  },
                  onSaved: (value){
                    _password = value;
                  },
                ),
                RaisedButton(
                  child: Text('登录'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: (){
                    if((_formKey.currentState).validate()){
                      _formKey.currentState.save();
                      print(_userName);
                      print(_password);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}