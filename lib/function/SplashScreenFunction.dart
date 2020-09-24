// Packages
import 'package:week_of_year/week_of_year.dart';

// Functions
import 'localStorage.dart';
import 'DealWithMaterial/downloadFile.dart';
import 'DealWithMaterial/MaterialToLocalStorage.dart';
import '../function/RandomNum.dart';

import 'DealWithMaterial/LocalStorageSavedUnsavedMaterialpage.dart';

checkForNewMaterial() async{
  bool AllDone ;
  // Make Sure that their are internet Connection
  DownloadFile SplashScreenDownload = DownloadFile();
  var connectionstate =await  SplashScreenDownload.internetConnection();
  if(connectionstate){
    //  - Their is Internet Connection
    //  - Get Current time
    //  - Check the last time we download the File
    final date = DateTime.now();
    var weekNum = date.weekOfYear;
    var lastcheckData = await localStorage.getData('Qata3alastcheckData');
    if (true) { // TODO change condition (lastcheckData + 3) <= weekNum
      // * Data never Checked or checked more than one month
      // - Download the File
      Future DownloadState = SplashScreenDownload.downloadFile('http://joghaimi.com/mat.json', 'MaterialName.json'); //
      // - Make Sure File is saved
      if (!SplashScreenDownload.ErrorDownload) {
        // -  save data in the local Storage
        DownloadState.then((value) async {
          if (value) { // - File Downloaded
            jsonToLocalStorage(); // Material To localStorage
            localStorage.saveData('Qata3alastcheckData', weekNum);
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