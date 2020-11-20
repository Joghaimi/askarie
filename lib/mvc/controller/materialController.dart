import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/db.dart';
import '../model/localStorage.dart';
import '../model/debug.dart';
import '../model/constant.dart';
import '../model/readFile.dart';
import '../view/materialScreen.dart';
import '../view/component/materialBox.dart';
import '../view/component/downloadMaterialBox.dart';
import '../model/fromInternet.dart';
import '../model/show.dart';
import '../model/sizeConfig.dart';
import '../controller/unitScreenController.dart';

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
        if(index<=(savedMaterial.length-1)){
          return MaterialBox(color: index, materialName: savedMaterial[index]);
        }else{
          return DownloadMaterialBox(materialName: nonSavedMaterial[index-(savedMaterial.length)]);
        }
      },
    );

  }
  static void openUnitPage({@required parent ,@required context , @required String materialName}){
    parent.setState(() {parent.iconPlace= ColoredCircularProgressIndicator();});
    UnitScreenController.initScreenController(materialName);
  }
  static void saveMaterial(parent ,context , String materialName) async{
    parent.setState(() {parent.iconPlace= ColoredCircularProgressIndicator();});
    parent.onTabCondition=false;
    bool theirIsInternetConnection = await FromInternet.internetConnection();
    String uniName = await LocalStorage.getStringData(data: "UNIName");
    if(theirIsInternetConnection){
      String fileURL  = 'http://joghaimi.com/kewy/$uniName/$materialName.json';
      String materialNames = '$materialName.json';
      bool fileDownloaded = await FromInternet.downloadFile(url: fileURL, fileName: materialNames);
      if(fileDownloaded){
        String filePath = "Temp/Kewy/Qata3a/";
        String fileName = materialNames;
        var insideFile = await ReadFile.readFile(path: filePath, fileName: fileName);
        var fileNotEmpty =(insideFile!="");
        if(fileNotEmpty){
          bool materialSaved = await saveMaterialInDB(materialName: materialName, file: insideFile,context: context);
          if(materialSaved){
            parent.setState(() {parent.iconPlace=FaIcon(
            FontAwesomeIcons.arrowCircleLeft,
            size: SizeConfig.textMultiplier*5 ,
            color:Constant.C_White,
          );});
            Debug.printSt("Material Saved");
            saveLink(uniName: uniName, materialName: materialName);
            openUnitPage(parent: parent, context: context, materialName: materialName);
          }else{
            Debug.printSt("Material Not Saved IN DB");
            Show.snackBar(context: context, message: "حذث خطئ ما", color: Constant.C_Red);
          }
        }else{
          Debug.printSt("The File is empty");
          Show.snackBar(context: context, message: "حذث خطئ ما", color: Constant.C_Red);
        }
      }else{
        Show.snackBar(context: context, message: "حذث خطئ ما", color: Constant.C_Red);
      }
    }else{
      Show.snackBar(context: context, message: "تأكد من وجود انترنت", color: Constant.C_Gray);
    }
  }
  static Future<bool>saveMaterialInDB({@required String materialName ,@required file ,@required context})async{
    DB baseHelper = DB();
    bool tableExist =await baseHelper.isExist(tableName: materialName);
    Debug.printSt("Table Name $materialName");
    if(!tableExist){
      String sql = "CREATE TABLE IF NOT EXISTS $materialName(id INTEGER PRIMARY KEY, UnitName TEXT,QS TEXT, A_Ans TEXT,B_Ans TEXT,C_Ans TEXT, D_Ans TEXT,solution INTEGER)";
      await baseHelper.createDBTable(tableQuery: sql);
      var questions  = await json.decode(file)['unit'];
      for(var qs in questions){
        var map = Map<String,dynamic>();
        map ['UnitName']    =  qs[0];
        map ['QS']          =  qs[1];
        map ['A_Ans']       =  qs[2];
        map ['B_Ans']       =  qs[3];
        map ['C_Ans']       =  qs[4];
        map ['D_Ans']       =  qs[5];
        map ['solution']    =  qs[6];
        await baseHelper.insert(mapInfo: map, tableName: materialName);
      }
      return true;
    }else{
      Debug.printSt("this material saved before");
      Show.snackBar(context: context, message: "حذث خطئ ما", color: Constant.C_Red);
      return false;
    }


  }
  static Future<void>saveLink({@required String uniName , @required String materialName})async{
    String fileURL  = 'http://joghaimi.com/kewy/$uniName/${materialName}_link.json';
    Debug.printSt(fileURL);
    String linkFileNames = '${materialName}_link.json';
    bool fileDownloaded = await FromInternet.downloadFile(url: fileURL, fileName: linkFileNames);
    if(fileDownloaded){
      String filePath = "Temp/Kewy/Qata3a/";
      String fileName = linkFileNames;
      var insideFile = await ReadFile.readFile(path: filePath, fileName: fileName);
      var fileNotEmpty =(insideFile!="");
      if(fileNotEmpty){
        MaterialController.saveLinkInDB(linkTableName: '${materialName}_link', file: insideFile);
      }
    }
  }
  static Future<void> saveLinkInDB({@required String linkTableName ,@required file})async{
    DB baseHelper = DB();
    bool tableExist =await baseHelper.isExist(tableName: linkTableName);
    if(!tableExist){
      String sql = "CREATE TABLE IF NOT EXISTS $linkTableName(id INTEGER PRIMARY KEY, linkName TEXT,linkUrl TEXT)";
      await baseHelper.createDBTable(tableQuery: sql);
      var linkArray  = await json.decode(file)['link'];
      for(var link in linkArray){
        Debug.printSt(link);
        var map = Map<String,dynamic>();
        map ['linkName']    =  link[0];
        map ['linkUrl']     =  link[1];
        await baseHelper.insert(mapInfo: map, tableName: linkTableName);
      }
    }
  }
}