// Dart抽象类：
// dart的抽象类主要是为了定义标准，子类可以继承抽象类，也可以实现抽象类接口
// 抽象类通过abstract来定义
// dart中的抽象方法不能使用abstract声明，dart中没有方法体的方法称之为抽象方法
// 子类继承抽象类必须实现里面的抽象方法
// 如果把抽象类看做接口的话，必须得实现里面的抽象方法
//抽象类不可被实例化，只有继承他的子类可以
abstract class Animal {
  eat();
  run();
  printInfo() {
    print('我是一个抽象类里面的普通方法');
  }
}

class Dog extends Animal {
  @override
  eat() {
    print('小狗在吃骨头');
  }
   run() {
    print('小狗在跑');
  }
}

main() {
  Dog dog = new Dog();
  dog.eat();
  dog.run();
  dog.printInfo();
}