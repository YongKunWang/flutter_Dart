/// Widget 继承于DiagnosticableTree类（诊断树类，主要作用是提供调试信息）
abstract class Widget extends DiagnosticableTree {
  /// 有参构造函数，用于子类的继承
  const Widget({ this.key });
  /// 这个key属性的主要作用为决定是否在下一次build是复用旧的Widget，
  /// 决定的条件在canUpdate方法中
  final Key key;

  /// 一个Widget可以对应多个element; flutter Framework 在构建UI树是，
  /// 会调用此方法生成对应节点的element对象，隐式调用，在开发过程中基本不会用到
  /// 最核心的定义
  @protected
  Element createElement();

  @override
  String toStringShort() {
    return key == null ? '$runtimeType' : '$runtimeType-$key';
  }
  /// 设置诊断树的一些特性，复写父类的方法
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.dense;
  }
  /// 静态方法，判读是否复用旧的widget
  static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType
        && oldWidget.key == newWidget.key;
  }
}


/// 抽象类StatelessWidget继承于Widget，
/// 其实StatelessWidget本身为一个widget
/// 用于不需要维护的场景
abstract class StatelessWidget extends Widget {
  /// 对于子类StatelessWidget来说，构造函数的参数key继承于父类
  /// 单例设计模式，只有一次实例变量
  /// 可选命名参数
  /// 子类的key参数继承于父类的key值
  const StatelessWidget({ Key key }) : super(key: key);
  /// 复写widget的方法，生成对应节点的element对象
  @override
  StatelessElement createElement() => StatelessElement(this);

  @protected
  Widget build(BuildContext context);
}


/// 也是继承于widget类
/// 重写了createElement
/// 返回的element对象不同
/// 新增加了新的接口createState()
abstract class StatefulWidget extends Widget {

  const StatefulWidget({ Key key }) : super(key: key);

  @override
  StatefulElement createElement() => StatefulElement(this);
  /// 使用createState来创建state对象
  /// 用于创建和Stateful Widget相关的状态，
  /// 在Stateful Widget的生命周期中多次调用
  /// 如果一个Widget对应于多个Element对象，则framework就会调用该方法为每一个位置生成一个独立的State实例
  /// 一颗构成用户界面的节点元素的树
  /// 
  /// 每一个Stateful widget会对应一个State类：
  ///      当状态改变时，可以使用setState告知flutter framework状态发生改变，framework会重新构建widget树
  /// 2个常用属性：
  ///   widget: State 实例只在第一次插入树中时被创建
  ///   context:：表示构建widget的上下文
  @protected
  State createState();
}
