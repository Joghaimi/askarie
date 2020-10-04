import 'package:shared_preferences/shared_preferences.dart';
class localStorage{
  // Get and Set Int Data
  static getData(String data) async{
    final prefs =await SharedPreferences.getInstance();
    final returnedData =prefs.getInt(data);
    if(returnedData == null){
      return 0;
    }else{
      return returnedData;
    }
  }
  // Save Data
  static saveData(String data,int value) async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setInt(data, value);
  }
  // Get and Set String Data
  static SaveString(String data,var value)async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setString(data, value);
  }
  static getDataString(String data) async{
    final prefs =await SharedPreferences.getInstance();
    final returnedData =prefs.getString(data);
    if(returnedData == null){
      return 0;
    }else{
      return returnedData;
    }
  }
  // Get and Set String Array Data
  static SaveStringArray(String data,var value)async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setStringList(data, value);
  }
  static getDataStringArray(String data) async{
    final prefs =await SharedPreferences.getInstance();
    final returnedData =prefs.getStringList(data);
    if(returnedData == null){
      return 0;
    }else{
      return returnedData;
    }
  }
}