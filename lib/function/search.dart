import 'package:flutter/material.dart';
import '../material/Units.dart';
import '../material/unit_one.dart';
import '../material/Unit_Two.dart';
class Search{
  static List Result =List();
  static search(search){
    var res;
    for(var unit in UnitsArray){
      for(var member in unit){
        res =member[1];
        if(res.contains(search)){
          Result.add(member);
        }
      }
    }
    }
  }

