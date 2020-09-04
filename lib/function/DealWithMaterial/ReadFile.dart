import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class ReadFile{

  static Future<File> _getLocalFile(String FileName) async {
    // get the path to the document directory.
    var documentDir = await getApplicationDocumentsDirectory();
    var Fullpath = documentDir.path + "Temp/Kewy/Qata3a/" +FileName;
    return new File(Fullpath);
  }
  static Future  readFile(String FileName) async {
    try {
      File file = await _getLocalFile(FileName);
      // read the variable as a string from the file.
      String flie = await file.readAsString();
      return flie;
    } on FileSystemException {
      return 0;
    }
  }

}