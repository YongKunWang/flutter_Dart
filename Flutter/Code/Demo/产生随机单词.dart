/// 命名路由的优缺点：
///   优点：直观，可以通过语义化的字符串来管理路由
///   缺点：无法接收路由参数
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Text(
              wordPair.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,'new_page');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increasing,
        tooltip: 'route',
        child: Icon(Icons.add),
      ),
    );
  }
}