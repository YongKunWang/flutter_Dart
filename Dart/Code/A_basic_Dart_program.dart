
printInteger(int aNumber){
  print('The number is $aNumber');
  print('The number is ${aNumber}');
}

/// 第一种格式
// void main() {
//   var number = 42;
//   printInteger(number);
// }

/// 第二种格式 箭头函数
///  =>expr语法是{return expr;}的形式的缩写
void main() => printInteger(100);