/// 可选参数
///   以命名参数{}包围
///   以基于位置的参数[]包围
///   不可同时使用
///   必选参数在前，可选参数在后
/// 
///     可选命名参数
void build1(int num, {String name, int ranges}){
  print("num = $num" );
  print("name = $name" );
  print("ranges = $ranges" );

}
/// 可选位置参数，如果指定在某个位置上的参数值，
/// 则前面位置必须优质，即使前面存在默认值
void build2(int num, [String name, int ranges]){
  print("num = $num" );
  print("name = $name" );
  print("ranges = $ranges" );

}
void main(){
  build1(     10,
                        name:"wyk",
                        ranges:12
                    );
  build2(10,"wyk");
}