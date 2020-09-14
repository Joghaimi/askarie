import 'dart:math';
import '../constent/Color.dart';
int RandomNum(){
  var rng = new Random();
  var x = rng.nextInt(MaterialColorArray.length-1);
  return x;
}