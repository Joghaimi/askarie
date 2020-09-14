// packages
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:week_of_year/week_of_year.dart';

// Constent
import '../constent/Color.dart';
import '../constent/Text.dart';
import '../material/Units.dart';

// Functions
import '../function/localStorage.dart';
import '../function/DealWithMaterial/downloadFile.dart';
import '../function/DealWithMaterial/MaterialToLocalStorage.dart';
import '../function/DealWithMaterial/LocalStorageSavedUnsavedMaterialpage.dart';

//Themes
import '../themes/AppTheme.dart';
import '../themes/size_config.dart';

//Screens
import 'units.dart';
import '../screens/AllMaterial.dart';

class splash_screen extends StatefulWidget {
  static final id = 'splash_screen';

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    OpenNewView();
//    final date = DateTime.now();
//    print(date.weekOfYear);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Container(
          child: Scaffold(
            body: Container(
              color: C_Purple,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Text(""),
                    ),
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: <Widget>[
                          LoadingDoubleFlipping.square(
                            borderColor: C_White,
                            backgroundColor: C_White,
                            borderSize: 3.0 * SizeConfig.textMultiplier,
                            size: 16 * SizeConfig.textMultiplier,
                          ),
                          Text(
                            AppName,
                            style: AppTheme.Titel.copyWith(
                              fontSize: 12 * SizeConfig.textMultiplier,
                              height: 0.3 * SizeConfig.heightMultiplier,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }

  Future<dynamic> OpenNewView() async {
    bool AllDone ;
    // Make Sure that their are internet Connection
    DownloadFile SplashScreenDownload = DownloadFile();
    var connectionstate =await  SplashScreenDownload.internetConnection();
    if(connectionstate){
      //  - Their is Internet Connection
      //  - Get Current time
      //  - Check the last time we download the File
      final date = DateTime.now();
      var weekNum = date.weekOfYear;
      var lastcheckData = await localStorage.getData('Qata3alastcheckData');
      if ((lastcheckData + 3) <= weekNum) {
        // * Data never Checked or checked more than one month
        // - Download the File
        Future DownloadState = SplashScreenDownload.downloadFile('http://joghaimi.com/mat.json', 'MaterialName.json'); //
        // - Make Sure File is saved
        if (!SplashScreenDownload.ErrorDownload) {
          // -  save data in the local Storage
          DownloadState.then((value) async {
            if (value) {
              // - File Downloaded
              jsonToLocalStorage(); // Material To localStorage
              localStorage.saveData('Qata3alastcheckData', weekNum);
            } else {
              // * File Feild to download
              SplashScreenDownload.ErrorDownload=true;
              print("**** File Feild to download ");
            }
          });
        } else {
          // * Error
          SplashScreenDownload.ErrorDownload=true;
        }

    }else{
      // No internet Connection
      Navigator.pushReplacementNamed(context, AllMaterial.id);
    }
    await localStorageSavedUnsavedMaterialPage();
    if(AllMaterial.Ready){
      Navigator.pushReplacementNamed(context, AllMaterial.id);
    }
  }
}
}
