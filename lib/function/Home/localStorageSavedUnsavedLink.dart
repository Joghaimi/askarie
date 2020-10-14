// Functions
import '../localStorage.dart';
import '../DB/DataBaseHelper.dart';

// Screen
import '../../screens/home.dart';
localStorageSavedUnsavedLink()async{
  // GetLinkArray
  var allLinkFromlocal = await localStorage.getDataStringArray('Link');
  for(var link in allLinkFromlocal){
    // Link Not Downloaded Before
    var returnData= await localStorage.getData(link);
    if(returnData == 0){
      Home.publicLinkToDownload.add(link);
    }
  }
}