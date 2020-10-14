// Function
import '../DB/DataBaseHelper.dart';
readLinks(state)async{
  // Initialize DB
  DataBaseHelper baseHelper=DataBaseHelper();
  // Create LinkDB if Not Exist
  baseHelper.createLinkTable();
  //Read All Private link
  var allLink = await baseHelper.getAllLink(state);
  print(allLink);
}

writeLink(state ,String linkTitle,String linkURL)async{ /// TODO 12/10/2020
  // Initialize DB
  DataBaseHelper baseHelper=DataBaseHelper();
  // Create LinkDB if Not Exist
  baseHelper.createLinkTable();

}