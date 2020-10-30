// Packages
import 'dart:convert';

import 'package:week_of_year/week_of_year.dart';

// Functions
import 'DealWithMaterial/ReadFile.dart';
import 'Home/readWriteLinks.dart';
import 'localStorage.dart';
import 'DealWithMaterial/downloadFile.dart';
import 'DealWithMaterial/MaterialToLocalStorage.dart';
import '../function/RandomNum.dart';
import 'DealWithMaterial/LocalStorageSavedUnsavedMaterialpage.dart';
checkForNewMaterial() async{
  // Check New Material and links
  // Make Sure that their are internet Connection
  DownloadFile SplashScreenDownload = DownloadFile();
  var connectionstate =await  SplashScreenDownload.internetConnection();
  if(connectionstate){ // connectionstate
    //  - Their is Internet Connection
    //  - Get Current time
    //  - Check the last time we download the File
    final date = DateTime.now();
    var weekNum = date.weekOfYear;
    if (true) { // TODO change condition (lastcheckData + 3) <= weekNum
      // Take UNI Name
      var UNIName = await localStorage.getDataString("UNIName");
      print(UNIName);
      // * Data never Checked or checked more than one month
      Future DownloadState =SplashScreenDownload.downloadFile('http://joghaimi.com/kewy/$UNIName/mat.json', 'MaterialName.json'); //
      // - Make Sure File is saved
      if (!SplashScreenDownload.ErrorDownload) {
        // -  save data in the local Storage
        await DownloadState.then((value) async {
          if (value) { // - File Downloaded
//            print(value);
            await jsonToLocalStorage(); // Material To localStorage
            await localStorage.saveData('Qata3alastcheckData', weekNum);
          } else { //  -  File Feild to download
            SplashScreenDownload.ErrorDownload=true;
            print("**** File Feild to download ");
          }
        });
      } else {
        // * Error
        SplashScreenDownload.ErrorDownload=true;
      }
    }
    return true;
  }
}
firstRun() async{
  var result = await localStorage.getDataString("UNIName");
  return result;
}
saveUniLink()async{
  // Start Download Data
  DownloadFile downloadMaterial = DownloadFile();
  var connectionstate =await  downloadMaterial.internetConnection();
  if(connectionstate){
    // Their is Internet Connection
    var UNIName = await localStorage.getDataString("UNIName");


    bool downloadState =await downloadMaterial.downloadFile('http://joghaimi.com/kewy/$UNIName/$UNIName.json', '$UNIName.json');
    if(downloadState){ // Download Sucess
      // Read File
      var linkCont      = await ReadFile.readFile('$UNIName.json');
      var jsonLinkCont  = json.decode(linkCont)['link'];
      // Insert Data
      for(var link in jsonLinkCont){
        writeLink("public" ,link[0],link[1] );
      }
      // Save it in Local storage
      var save= await localStorage.saveData(UNIName,1);

    }else{
      // Some Thing Wrong Happend
      return true;
    }
}
}

