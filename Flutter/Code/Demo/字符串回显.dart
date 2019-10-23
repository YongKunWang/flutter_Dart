import 'package:flutter/material.dart';

void main() => runApp(MyApp(text: "Hello World",));

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
    @required this.text,
    this.background:Colors.blue,
  }):super(key:key);

  final String text;
  final Color background;

  @override 
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: background,
        child: Text(text,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}