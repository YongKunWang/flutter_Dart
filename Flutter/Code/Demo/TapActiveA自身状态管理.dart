/// 管理自身状态

import 'package:flutter/material.dart';

void main() => runApp(TapboxA());

class TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    print('_cative = $_active');
    setState((){
      if(_active)
        _active = false;
      else
        _active = true;
    });
    print(' Tap _cative = $_active');
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active?"Active":"Inactive",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }
}