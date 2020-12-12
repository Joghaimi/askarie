import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'constant.dart';
class GetRandom{
  static colorIndex(){
    var rng = new Random();
    var x = rng.nextInt(Constant.MaterialColorArray.length-1);
    return x;
  }
  static returnColorIndex({@required int index}){
    return index < Constant.MaterialColorArray.length?index:GetRandom.colorIndex();
  }
}