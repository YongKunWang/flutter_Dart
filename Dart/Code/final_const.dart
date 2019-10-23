
// 关于const和final
//  如果你不打算修改一个变量，使用final或者const
//  一个fianl只能被赋值一次；
//  一个const变量是编译常量(const变量同时也是fianl变量)
//  顶级的fianl变量或者类中的final变量在第一次使用的时候初始化
// 注意：实例变量可以为fianl但是不能为const

  // 测试final
// main() {
//   print('final 只能赋值一次');
//   final a = 10;
//   print(a);
// }

// const 为编译时常量 
// 如果const在类中，请定义为static const
// 可以直接const变量，也可以使用其他的const变量的值来初始化其值
//  const bar = 100; const atm = 1.10 * bar;

// const不仅仅用来定义常量。也可以用来创建不变的量
// const 还可以创建构造函数为const类型，这种类型的构造函数创建的对象是不可改变的
// 任何变量都可以有一个不变的值
// var foo = const []; foo当前是一个空的不变的量
// final bar = const []; bar总是一个EIA，无法改变值
// const baz = const []; baz是一个编译时EIA，无法改变值

abstract class Animal {
  String name;
  // 抽象类的构造函数在实例化之前实现
  const Animal(String name) {
    this.name = name;
  }
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