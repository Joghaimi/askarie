import 'package:shared_preferences/shared_preferences.dart';

class localStorage{
  // getData
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


}