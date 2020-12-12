import 'package:askarie/mvc/model/debug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/db.dart';
import '../model/getRandom.dart';
import '../model/sizeConfig.dart';
import '../model/constant.dart';
import '../model/apptheme.dart';
import '../view/unitScreen.dart';
import '../view/component/unitBox.dart';


class UnitScreenController{
  static int showUnits =0;
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
    if(showUnits==0){
      return Container(
        height: 65*SizeConfig.heightMultiplier,
        child: ListView.builder(
            itemCount: UnitScreenController.unitNames.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return   UnitBox(unitName: UnitScreenController.unitNames[index],unitIndex: index,progress: 0,color: GetRandom.returnColorIndex(index: index),) ;
            }),
      );
    }else if(showUnits==1){ // TODO 12/12/2020
      return Text("SHOW Links") ;
    }else if(showUnits==2){
      return Text("SAhmad");
    }

  }
  static Widget returnUnUsefulImage(){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(0, 5 * SizeConfig.heightMultiplier, 0, 0),
            child:
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 40* SizeConfig.widthMultiplier,
              ),
            )

        ),
        SizedBox(
          width: 10* SizeConfig.widthMultiplier,
        ),
        Image.asset("images/women.png",width: SizeConfig.textMultiplier*25,),
      ],

    );
  }
  static Widget returnTabBar(parent){
    return Padding(
      padding: EdgeInsets.fromLTRB(
          2 * SizeConfig.widthMultiplier,
          5 * SizeConfig.heightMultiplier,
          2 * SizeConfig.widthMultiplier,
          2 * SizeConfig.heightMultiplier),
      child: FlutterToggleTab(
        borderRadius: 20,
        height: 7 * SizeConfig.heightMultiplier,
        width: 20 * SizeConfig.widthMultiplier,
        initialIndex: 0,
        selectedBackgroundColors: [Constant.PrimaryColor],
        selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 2.3 * SizeConfig.textMultiplier,
            fontWeight: FontWeight.w700),
        unSelectedTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 2 * SizeConfig.textMultiplier,
            fontWeight: FontWeight.w500),
        labels: [Constant.ourMl5s, Constant.otherRelatedFile,Constant.makeExam],
        selectedLabelIndex: (index) {
          parent.setState(() {
            UnitScreenController.showUnits = index;
          });
        },
      ),
    );
  }
  static Widget returnChoiceOption({@required parent , @required Color color}){
    return Container(
        height: SizeConfig.heightMultiplier * 10,
        width: SizeConfig.heightMultiplier*20.6,
        decoration:AppTheme.MaterialUnitBoxContainer.copyWith(color: Colors.white),
        child:Row(
          children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(
                  SizeConfig.widthMultiplier * 3,
                  0,
                  SizeConfig.widthMultiplier * 8,
                  0),
              child: GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.book,
                  size: SizeConfig.textMultiplier *6 ,
                  color:color,
                ),
                onTap: (){
                  // OPEN QS
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(
                  SizeConfig.widthMultiplier * 3,
                  0,
                  SizeConfig.widthMultiplier * 3,
                  0),
              child: GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.questionCircle,
                  size: SizeConfig.textMultiplier *6 ,
                  color:color,
                ),
                onTap: (){
                  // OPEN QS
                },
              ),
            ),
          ],
        )
    );
  }
}
