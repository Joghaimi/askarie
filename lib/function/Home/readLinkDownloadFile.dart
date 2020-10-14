import '../DealWithMaterial/ReadFile.dart';
import 'dart:convert';
import '../localStorage.dart';

Future<void> jsonLinkToLocalStorage() async {
  // ignore: non_constant_identifier_names
  var linkName      = await ReadFile.readFile('link.json');
  var JsonMaterialName  = json.decode(linkName)['link'];
  List<String> AllmaterialArray=new List();
  for(var material in JsonMaterialName){
    AllmaterialArray.add(material.toString());
  }
  await localStorage.SaveStringArray('Link', AllmaterialArray);
}