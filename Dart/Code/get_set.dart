/// 1 初始化简写格式
// class Rect {
//   num height;
//   num width;
//   Rect(this.height,this.width);
//   num mianji() {
//     return this.height * this.width;
//   }
// }
// void main(){
//   Rect r = Rect(1,2);
//   print('${r.mianji()}');
// }

/// 2 get 和 set
// class Rect {
//   num height;
//   num width;
//   Rect(this.height,this.width);
//   get mianji {
//     return this.height * this.width;
//   }
//   set setheight(value) => height = value;
// }
// void main(){
//   Rect r = Rect(2,2);
//   r.setheight = 10;
//   print('${r.mianji}');
// }


/// 3 级联
// class Rect {
//   num height;
//   num width;
//   Rect(this.height,this.width);
//   get mianji {
//     return this.height * this.width;
//   }
//   set setheight(value) => height = value;
// }
// void main(){
//   Rect r = Rect(2,2)
//     ..setheight = 10;
//   print('${r.mianji}');
// }