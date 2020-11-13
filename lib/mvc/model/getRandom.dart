import 'dart:math';
import 'constant.dart';
class GetRandom{
  static colorIndex(){
    var rng = new Random();
    var x = rng.nextInt(Constant.MaterialColorArray.length-1);
    return x;
  }
}