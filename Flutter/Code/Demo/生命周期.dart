import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  const MyApp({Key key, this.initvalue:0}):super(key:key);
 
  final int initvalue;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _counter;
  @override 
  void initState() {
    super.initState();
    _counter = widget.initvalue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      home: Center(
        child: FlatButton(
          child: Text('$_counter',
            textDirection: TextDirection.ltr,
          ),
          onPressed: () => setState(()=> ++ _counter),
          color: Colors.blue,
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }
  @override
  void deactivate() { 
    super.deactivate();
    print('deactivate');
  }
  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }



}