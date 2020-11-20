import 'package:askarie/mvc/model/debug.dart';
import 'package:flutter/cupertino.dart';
import '../model/db.dart';

class UnitScreenController{
  static List<String> unitNames=[] ;
  static var linkArray=[] ;
  static String materialName ;
  static Future <void> initScreenController(String materialName)async{
    UnitScreenController.materialName = materialName;
    await getUnitName(materialName: UnitScreenController.materialName);
    await getLinkArray(materialName: UnitScreenController.materialName);
  }
  static Future<void> getUnitName({@required String materialName})async{
    DB baseHelper = DB();
    String sqlStmt = "Select DISTINCT UnitName FROM $materialName";
    var unitsName = await baseHelper.readFromDB(sqlStmt: sqlStmt, args: []);
    for(var unitName in unitsName){
      unitNames.add(unitName['UnitName']);
    }
  }
  static Future<void>getLinkArray({@required String materialName})async{
    DB baseHelper = DB();
    String sqlStmt = "Select * FROM ${materialName}_link";
    var links = await baseHelper.readFromDB(sqlStmt: sqlStmt, args: []);
    for(var link in links){
      linkArray.add(link);
    }
  }
}
