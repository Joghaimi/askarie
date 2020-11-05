import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'debug.dart';
class FromInternet{
  static final appName="Qata3a";
  static Future<bool> internetConnection() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    var notConnectedToInternet = (connectivityResult == ConnectivityResult.none);
    if (notConnectedToInternet) {
      Debug.printSt("No INTERNET Connection");
      return false;
    }else{
      Debug.printSt("Device Connected to internet");
      return true;
    }
  }
  static Future<bool> downloadFile({@required String url,@required String fileName}) async {
    Debug.printStartOperation("Start Downloading File");
    var documentDir = await getApplicationDocumentsDirectory();
    var fullPath = documentDir.path + "Temp/Kewy/${FromInternet.appName}/" +fileName;
    Debug.printSt("Save To this Path $fullPath");
    Dio dio = Dio();
    try {
      Debug.printSt("Downloading File");
      await dio.download(
        url, fullPath,
        onReceiveProgress: (rcv, total) {Debug.printSt(rcv);},
      );
      Debug.printEndOperation("FinishDownload ");
      return true;
    } catch (e) {
      Debug.printEndOperation("Error While Downloading .. Try Again ");
      return false;
    }
  }
}