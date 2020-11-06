import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'debug.dart';

class ReadFile {
  static Future<String> readFile(
      {@required String path, @required String fileName}) async {
    Debug.printStartOperation("Start Read $fileName File");
    Directory documentDir = await getApplicationDocumentsDirectory();
    String savedFileDirectory = (documentDir.path) + (path) + fileName;
    File savedFile = File(savedFileDirectory);
    try {
      String savedFileInfo = await savedFile.readAsString();
      Debug.printEndOperation("File $fileName Read Successfully");
      return savedFileInfo;
    } catch (error) {
      Debug.printEndOperation("Can't Read File $fileName");
      return "";
    }
  }
}
