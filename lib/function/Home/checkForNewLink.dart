// Packages
import 'package:week_of_year/week_of_year.dart';

// Functions
import '../localStorage.dart';
import '../DealWithMaterial/downloadFile.dart';
import 'readLinkDownloadFile.dart';
checkForNewLink() async{
  DownloadFile splashScreenDownload = DownloadFile();
  var connectionstate =await  splashScreenDownload.internetConnection();
  if(connectionstate){
    final date = DateTime.now();
    var weekNum = date.weekOfYear;
    if (true) { // TODO change condition (lastcheckData + 3) <= weekNum
      // * Data never Checked or checked more than one month
      // - Download the File
      Future downloadState =splashScreenDownload.downloadFile('http://joghaimi.com/kewy/link.json', 'link.json'); //
      // - Make Sure File is saved
      if (!splashScreenDownload.ErrorDownload) {
        // -  save data in the local Storage
        await downloadState.then((value) async {
          if (value) { // - File Downloaded
            await jsonLinkToLocalStorage(); // Material To localStorage
            await localStorage.saveData('LinklastcheckData', weekNum);
          } else { //  -  File Feild to download
            splashScreenDownload.ErrorDownload=true;
            print("File Feild to download ");
          }
        });
      } else {
        // * Error
        splashScreenDownload.ErrorDownload=true;
      }
    }
    return true;
  }
}
