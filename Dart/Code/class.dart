/// dart中的类：
/// dart中的所有对象都是某一个类的实例，所有的类有同一个基类
/// Dart是一个面向对象的语言，并且支持mixin的继承方式
/// 一个类可以继承自多个父类


// 测试创建对象
// class Person{
//   String name;
//   int age;
//   // Person(String name, int age){
//   //   this.name = name;
//   //   this.age = age;
//   // }
//   Person(this.name,this.age);
//   /// 命名构造函数
//   Person.fromDictionary(Map dic){
//     this.name = dic["name"];
//     this.age = dic["age"];
//   }
//   void getPerson(){
//     print('name = $name');
//     print('age = $age');

//   }
// }
// void main(){
//   Person son1 = new Person('wyk',20);
//   son1.getPerson();
// }



/// 测试子类的创建之一：
/// 先创建父类，再创建子类
// class FuPerson{
//   String name;
//   int age;
//   FuPerson(){
//     print('In Fu Person');
//   }
// }
// class ZiPerson extends FuPerson{

//   ZiPerson(){
//     print('In Zi Person');
//   }
// }
// void main(){
//   ZiPerson son = new ZiPerson();
// }

/// 子类的创建之命名构造函数
// class FuPerson{
//   String name;
//   int age;
//   FuPerson.fromDictionary(Map dic){
//     print('In Fu Person');
//   }
// }
// class ZiPerson extends FuPerson{
  
//   /// error 父类没有无参数的，非命名的构造函数，
//   /// 所以必须手动调用一个父类的构造函数
//   ZiPerson.fromDictionary(Map dic){
//     print('In Zi Person');
//   }

//   /// current
//   ZiPerson.fromDictionary(Map dic):super.fromDictionary(dic){
//     print('In Zi Person');
//   }
// }
// void main(){
//   ZiPerson son = new ZiPerson.fromDictionary({'wyk':20});
// }


/// 静态构造函数(单例)
/// 如果想让类产生一个永远不会改变的对象，可以让这些对象成为编译时常量
/// 需要定义一个const构造函数并确保所有的实例变量都是final的
/// int和double是num的子类
class Point{
  final num x;
  final num y;
  const Point(this.x, this.y);
}
