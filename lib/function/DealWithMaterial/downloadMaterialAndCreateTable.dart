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
    bool downloadState =await downloadMaterial.downloadFile('http://joghaimi.com/${materialName}.json', '${materialName}.json');
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
        material.saveData(materialName, QS[0], QS[1], QS[2], QS[3], QS[4], QS[5], QS[6]);
        baseHelper.insertMaterial(material);
      }
      // Change icon to go icon or open new widget
      return true;
    }else{
      // Some Thing Wrong Happend
      return true;
    }

  }


}