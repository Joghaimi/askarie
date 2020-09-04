import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final String URL = "http://joghaimi.com/mat.json";
final String filename = "ahmad.json";
// ignore: missing_return

class DownloadFile{
  DownloadFile();
  var FolderPath;
  var FolderURL;
  var FileName;
  bool DownloadStatus =false;
  bool ErrorDownload;
  bool internetConnectionsta =false;
  void internetConnection() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        internetConnectionsta=true;
      }
    } on SocketException catch (_) {
      internetConnectionsta=false;
    }
  }
  Future<void> downloadFile(var FolderPath, var FolderURL,var FileName) async {
    this.FolderPath =FolderPath;
    this.FolderURL  =FolderURL;
    this.FileName   =FileName;
    var documentDir = await getApplicationDocumentsDirectory();
    var Fullpath = documentDir.path + "Temp/Kewy/Qata3a/" + filename;
    Dio dio = Dio();
    try {
      dio.download(
          URL,
          Fullpath,
          onReceiveProgress: (rcv, total) {rcv ==total?DownloadStatus =true:DownloadStatus=false;}
      );
//      print(Fullpath);
    } catch (e) {
      ErrorDownload=true;
//      print(e);
    }
  }

}

