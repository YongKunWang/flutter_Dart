// Dart的模块比较像C/C++/JAVA
// 是将import的文件直接注入到当前文件全局作用域下

// Dart引入关键词为import 支持使用as来进行重命名
// 使用deferred as 来延迟加载
// 支持使用 show/hide组合器来限定引用范围

// 引入库的三种方法：

//    import 'dart:math'; 引入dart的标准库
//    import '绝对路径/相对路径'; 引入dart本地文件
//    import 'package:xxx/xxx.dart'; 引入使用Pub包管理系统中的dart库

// dart库的重名名：
//    import 'dart:math' as Shuxue;

// dart库的显示和隐藏
// import 'dart:math' show xx;
// import 'dart:math' hide xx;

// dart的延迟加载 只有在使用时才被加载
// import 'dart:io' deferred as Uesd;


import 'dart:math' as Shuxue show max,pi hide min; 
import 'dart:io' deferred as Uesd;  //延迟加载

main() {
  print(Shuxue.pi);
  print((Shuxue.max(1,100) == 100));
  print((Shuxue.min(1,100) == 1));

  // assert 为语言内置的断言函数，仅在检查模式下有效
  // 在开发过程中，除非条件为真，否则会引发异常
}