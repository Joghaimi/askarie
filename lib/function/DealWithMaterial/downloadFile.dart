import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final String URL = "http://joghaimi.com/mat.json";
final String filename = "ahmad.json";
// ignore: missing_return

class DownloadFile{
  DownloadFile();
  var FolderURL;
  var FileName;
  bool DownloadStatus =false;
  bool ErrorDownload = false;
  Future internetConnectionsta ;
  Future<bool> internetConnection() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }else{
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
  Future<bool> downloadFile(var FolderURL,var FileName) async {
    this.FolderURL  =FolderURL;
    this.FileName   =FileName;
    var documentDir = await getApplicationDocumentsDirectory();
    var Fullpath = documentDir.path + "Temp/Kewy/Qata3a/" + this.FileName;
    Dio dio = Dio();
    try {
      await dio.download(
          this.FolderURL,
          Fullpath,
          onReceiveProgress: (rcv, total) {
            print('$rcv / $total');
            rcv ==total?DownloadStatus =true:DownloadStatus=false;
          },
      );
      return true;
    } catch (e) {
      print('OOOO Download ERRO');
      ErrorDownload=true;
      DownloadStatus =false;
      return false;
    }
//    return false;
  }

}

