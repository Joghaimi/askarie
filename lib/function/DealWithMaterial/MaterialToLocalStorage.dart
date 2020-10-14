import 'ReadFile.dart';
import 'dart:convert';
import '../localStorage.dart';

Future<void> jsonToLocalStorage() async {
  // ignore: non_constant_identifier_names
  var MaterialName      = await ReadFile.readFile('MaterialName.json');
  var JsonMaterialName  = json.decode(MaterialName)['Material'];
  List<String> AllmaterialArray=new List();
  for(var material in JsonMaterialName){
    AllmaterialArray.add(material.toString());
  }
   await localStorage.SaveStringArray('Material', AllmaterialArray);
}