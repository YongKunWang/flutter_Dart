/// 资源管理
/// yaml文件中的flutter配置部分：
///       assets:
///         - media/btn.png
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    
    return MaterialApp(
      title: 'Flutter Route',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        "new_page": (context)=>MyApp(),
      },
      home: MyHomePage(title: 'Flutter Demo Route Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,this.title}):super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wordPair = new WordPair.random();
  int _counter = 0;
  void _increasing() {
    setState(() {
     _counter ++; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('media/btn.png'),
        )
      ),
    );
  }
    
}