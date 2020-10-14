// Function
import '../DB/DataBaseHelper.dart';
readLinks(state) async {
  // Initialize DB
  DataBaseHelper baseHelper = DataBaseHelper();
  // Create LinkDB if Not Exist
  baseHelper.createLinkTable();
  //Read All Private link
  var allLink = await baseHelper.getAllLink(state);
  return allLink;

}
writeLink(state, String linkTitle, String linkURL) async {
  // Initialize DB
  DataBaseHelper baseHelper = DataBaseHelper();
  // Create LinkDB if Not Exist
  baseHelper.createLinkTable();
  // Save Link In Map
  var linkMap = Map<String, dynamic>();
  linkMap['LinkName'] = linkTitle;
  linkMap['LinkURL'] = linkURL;
  linkMap['state'] = state; // string
  // Save Link To DB
  baseHelper.insertLink(linkMap);
  print("inserted");
}
deleteLink(String linkURL){

}