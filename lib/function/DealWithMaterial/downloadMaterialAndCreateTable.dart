// Packages
import 'dart:convert';

// Function
import 'downloadFile.dart';
import '../localStorage.dart';
// Function DataBase
import '../DB/material.dart';
import '../DB/DataBaseHelper.dart';
import '../DealWithMaterial/ReadFile.dart';



downloadMaterialAndCreateTable(String materialName) async{
  // Start Download Data
  DownloadFile downloadMaterial = DownloadFile();
  // Material
  Material material =Material();
  material.TableName =materialName;
  var connectionstate =await  downloadMaterial.internetConnection();
  if(connectionstate){
    // Their is Internet Connection
    // Take UNI Name
    var UNIName = await localStorage.getDataString("UNIName");
    bool downloadState =await downloadMaterial.downloadFile('http://joghaimi.com/kewy/$UNIName/${materialName}.json', '${materialName}.json');
    if(downloadState){ // Download Sucess
      // Read File
      var materialCont      = await ReadFile.readFile('${materialName}.json');
      var jsonMaterialCont  = json.decode(materialCont)['unit'];
      //Save The number of QS in Local Storage
      localStorage.saveData(materialName+"qsNum",jsonMaterialCont.length); // If their is Error MayBe Here
      // Create Table
      DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
      baseHelper.createDBTable(materialName);
      // Insert Data
      for(var QS in jsonMaterialCont){
        var map = Map<String,dynamic>();
        map ['UnitName']    =  QS[0];
        map ['QS']          =  QS[1];
        map ['A_Ans']       =  QS[2];
        map ['B_Ans']       =  QS[3];
        map ['C_Ans']       =  QS[4];
        map ['D_Ans']       =  QS[5];
        map ['solution']    =  QS[6];
        baseHelper.insertMaterial(materialName,map);
      }
      return true;
    }else{
      // Some Thing Wrong Happend
      return true;
    }

  }


}