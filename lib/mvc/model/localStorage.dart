import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage{
  static Future<int>getIntData({@required String data}) async{
    /// Return Int Value For saved Data on local Storage & Return -1 if data Not Found
    final prefs =await SharedPreferences.getInstance();
    final returnedData =prefs.getInt(data);
    bool dataFound = (!(returnedData == null));
    if(dataFound){
      return returnedData;
    }else{
      return -1;
    }
  }
  static void saveIntData({@required String data,int value}) async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setInt(data, value);
  }
  static Future<String> getStringData({@required String data}) async{
    /// Return String Value For saved Data on local Storage & Return "" if data Not Found
    final prefs =await SharedPreferences.getInstance();
    final returnedData =prefs.getString(data);
    bool dataFound = (!(returnedData == null));
    if(dataFound){
      return returnedData;
    }else{
      return "";
    }
  }
  static saveStringData({@required String data,@required String value})async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setString(data, value);
  }
  static Future<List<String>> getDataStringArray({@required String data}) async{
    /// Return String Array || Null if nothing is Found
    final prefs =await SharedPreferences.getInstance();
    final returnedData =prefs.getStringList(data);
    bool dataFound = (!(returnedData == null));
    if(dataFound){
      return returnedData;
    }else{
      return null;
    }
  }
  static saveStringArray({@required String data,@required List<String>value})async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setStringList(data, value);
  }


}