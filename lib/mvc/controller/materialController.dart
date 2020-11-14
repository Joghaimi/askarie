import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import '../model/db.dart';
import '../model/localStorage.dart';
import '../model/debug.dart';
import '../view/materialScreen.dart';
import '../view/component/materialBox.dart';

class MaterialController{
  static List<String> savedMaterial =[];
  static List<String> nonSavedMaterial =[];
  static void initMaterialPage(parent , context)async{
    clearOldSavedInfo();
    await getSavedAndNonSavedMaterial();
    Debug.printSt("Saved Material : $savedMaterial");
    Debug.printSt("Non Saved Material :$nonSavedMaterial");
    parent.setState(() {
      WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.pushNamed(context, MaterialScreen.id));
    });
  }
  static Future<void> getSavedAndNonSavedMaterial()async{
    DB baseHelper = DB();
    List<String> allAvailableMaterial=await LocalStorage.getDataStringArray(data: "Material");
    for(String material in allAvailableMaterial){
      bool materialSavedBefore = await baseHelper.isExist(tableName: material);
      if(materialSavedBefore){
        savedMaterial.add(material);
      }else{
        nonSavedMaterial.add(material);
      }
    }
  }
  static void clearOldSavedInfo(){
    savedMaterial.clear();
    nonSavedMaterial.clear();
  }
  static Widget returnMaterialList(){
    int materialCount =0;
    materialCount = (savedMaterial.length)+nonSavedMaterial.length;
    return  ListView.builder(
      itemCount: materialCount,
      itemBuilder: (BuildContext ctxt, int index){
        if(index<(savedMaterial.length-1)){
          return MaterialBox(color: index, materialName: savedMaterial[index]);
        }else{
          return MaterialBox(color: index, materialName: nonSavedMaterial[index]);
        }
      },
    );

  }
  static void openUnitPage(parent ,context ){
    parent.setState(() {parent.iconPlace= ColoredCircularProgressIndicator();});
    // TODO OpenUnitPage
  }



















//          // Save All Unit Name // @TODO OPEN UNIT PAGE
//          DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
//          var material_name = await baseHelper.getUnitName(widget.materialName);
//          // Go To Unit Page
//          Units.materialName=widget.materialName;
//          // Empty the array
//          Units.UnitName.clear();
//          var cont = 0;
//          var savedUnitname;
//          for(var material in material_name){
//            if(! Units.UnitName.contains(material['UnitName'])){
//              Units.UnitName.add(material['UnitName']); // Unit Name
//              Units.unitScore.add(await getUnitScore(widget.materialName, material['UnitName'])); //@todo It save 0 Data
////              print(await getUnitScore(widget.materialName, material['UnitName']));
//              cont ++ ;
//            }
//          }
//          Units.unitNumber=cont;
//          Navigator.pushReplacementNamed(context, Units.id);
//          //return icon to what it was
//          setState(() {iconPlace= FaIcon(
//            FontAwesomeIcons.arrowCircleLeft,
//            size: SizeConfig.textMultiplier*5 ,
//            color:C_White,
//          );});



}