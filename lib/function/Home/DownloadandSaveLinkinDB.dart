// Packages
import 'dart:convert';
// Function
import '../DealWithMaterial/downloadFile.dart';
import 'readWriteLinks.dart';
import '../localStorage.dart';
// Function DataBase
import '../DealWithMaterial/ReadFile.dart';
// Screen
import '../../screens/home.dart';

downloadLinkAndCreateTable(parent , String univLink) async{
  // Start Download Data
  DownloadFile downloadMaterial = DownloadFile();
  var connectionstate =await  downloadMaterial.internetConnection();
  if(connectionstate){
    // Their is Internet Connection
    bool downloadState =await downloadMaterial.downloadFile('http://joghaimi.com/kewy/$univLink.json', '$univLink.json');
    if(downloadState){ // Download Sucess
      // Read File
      var linkCont      = await ReadFile.readFile('$univLink.json');
      var jsonLinkCont  = json.decode(linkCont)['link'];
      // Insert Data
      for(var link in jsonLinkCont){
        writeLink("public" ,link[0],link[1] );
      }
      // Save it in Local storage
      var save= await localStorage.saveData(univLink,1);
      parent.setState(() {
        Home.publicLinkToDownload.remove(univLink);
      });
      return true;
    }else{
      // Some Thing Wrong Happend
      return true;
    }



  }


}