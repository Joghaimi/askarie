import 'package:askarie/component/PublicBoxLink.dart';
import 'package:askarie/mvc/model/debug.dart';
import 'package:flutter/cupertino.dart';
import '../model/db.dart';
import '../view/unitScreen.dart';

class UnitScreenController{
  static bool showUnits =true;
  static List<String> unitNames=[] ;
  static var linkArray=[] ;
  static String materialName ;
  static Future <void> initScreenController({@required parent ,@required context ,@required String materialName})async{
    UnitScreenController.materialName = materialName;
    await getUnitName(materialName: UnitScreenController.materialName);
    await getLinkArray(materialName: UnitScreenController.materialName);
    parent.setState(() {
      WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.pushNamed(context,  UnitScreen.id));
    });
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
  static Widget returnUnitContentPageList({@required parent}){
    if(showUnits){
      return ListView.builder(
          itemCount: UnitScreenController.unitNames.length,
          itemBuilder: (BuildContext ctxt, int index) {
            // Return non Saved Material
            return   Text("SHOW units") ;
          });
    }else{
      return Text("SHOW Links") ;
    }

  }
}
