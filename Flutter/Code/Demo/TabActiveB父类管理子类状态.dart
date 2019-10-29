/// 父类管理子类状态
import 'package:flutter/material.dart';

void main() => runApp(ParentTapboxB());

/// 父类
class ParentTapboxB extends StatefulWidget {
  @override
  _ParentTapboxBState createState() => _ParentTapboxBState();
}

class _ParentTapboxBState extends State<ParentTapboxB> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
     _active = newValue; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

/// 子类
class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active:false, @required this.onChanged})
    :super(key:key);

  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }
  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child:Text(
            active ? "Active":"Inactive",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen:Colors.grey,
        ),
      ),
    );
  }
}