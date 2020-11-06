import 'package:flutter/cupertino.dart';
import '../view/homeScreen.dart';
import '../view/firstUseScreen.dart';
import '../model/localStorage.dart';
import '../model/debug.dart';
import '../model/fromInternet.dart';
import '../model/readFile.dart';

class SplashScreenController {
  static initSplashScreen(parent, context) async {
    bool firstUse = await isItFirstRun();
    if (!firstUse) {
      await checkForNewMaterial();
      parent.setState(() {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.pushNamed(context, HomeScreen.id));
      });
    } else {
      parent.setState(() {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.pushNamed(context, FirstUseScreen.id));
      });
    }
  }
  static Future<bool> isItFirstRun() async {
    /// Return True is it's the First use
    Debug.printStartOperation("Check If its the First Use");
    var result = await LocalStorage.getStringData(data: "UNIName");
    bool firstUse = (result == "");
    Debug.printEndOperation("$firstUse \n Check If its the First Use");
    return firstUse;
  }
  static Future<bool> checkForNewMaterial() async {
    /// Return True if their is New File
    /// Return false if their is no File or No internet connection
    Debug.printStartOperation("checkForNewMaterial");
    bool isTheirInternetConnection = await FromInternet.internetConnection();
    if (isTheirInternetConnection) {
      String universityName = await LocalStorage.getStringData(data: "UNIName");
      String materialAvailableForThisUniversityURL =
          'http://joghaimi.com/kewy/$universityName/mat.json';
      bool fileDownloaded = await FromInternet.downloadFile(
          url: materialAvailableForThisUniversityURL,
          fileName: 'MaterialName.json');
      if (fileDownloaded) {
        Debug.printStartOperation("Save Matrial Name in local Storage");
        await saveMaterialNameInLocalStorage();
        Debug.printEndOperation("Finish Saving Matrial Name in local Storage");
        Debug.printEndOperation("End checkForNewMaterial Successfully");
        return true;
      } else {
        Debug.printEndOperation("End checkForNewMaterial Failed");
        return false;
      }
    } else {
      Debug.printEndOperation("End checkForNewMaterial Failed");
      return false;
    }
  }
  static Future<void> saveMaterialNameInLocalStorage() async {
    String filePath = "Temp/Kewy/Qata3a/";
    String fileName = 'MaterialName.json';
    String readFile =
        await ReadFile.readFile(path: filePath, fileName: fileName);
    String materialListKey = "Material";
    bool fileFoundAndNotEmpty = (readFile != "");
    if (fileFoundAndNotEmpty) {
      await LocalStorage.saveJsonDataAsString(
          jsonList: readFile, listKey: materialListKey);
    }
  }
}
