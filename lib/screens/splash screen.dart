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
    Future connectionstate = SplashScreenDownload.internetConnection();
    connectionstate.then((value) async {
      if (!value) {


      } else {
        //  - Their is Internet Connection
        //  - Get Current time
        //  - Check the last time we download the File
        final date = DateTime.now();
        var weekNum = date.weekOfYear;
        var lastcheckData = await localStorage.getData('Qata3alastcheckData');
        if ((lastcheckData + 3) >= weekNum) {
          // * Data checked less than one month
          // * Go To the new page
        } else {
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
                localStorage.saveData('Qata3alastcheckData', weekNum); // @ TODO uncomut this to save the date
              } else {
                // * File Feild to download
                SplashScreenDownload.ErrorDownload=true;
                print("**** File Feild to download ");
              }
            });
          } else {
            // * Error
            SplashScreenDownload.ErrorDownload=true;
            print("XXX IN ERROR Page ");
          }
        }
      }
    });
    return Future.delayed(const Duration(milliseconds: 3000), () async{
          // ignore: non_constant_identifier_names
          var AllMaterialFromlocal = await localStorage.getDataStringArray('Material');
          AllMaterial.AllMaterialNum= AllMaterialFromlocal.length;
          if(AllMaterialFromlocal!=0){
            for (int i = 0; i < AllMaterialFromlocal.length; i++) {
              // TODO NUM#1 ==> its related in ToDo in ALL material Page
              AllMaterial.AllMaterials[i] = AllMaterialFromlocal[i];
            }
          }else{
            // * No Data Saved
            print('No Saved Material');
          }

      setState(() {
        Navigator.pushReplacementNamed(context, AllMaterial.id);
      });
    });
//    for (int i = 0; i < Units_Name.length; i++) {
//      Units.UnitScore[i] = await localStorage.getData(Units_Name[i]);
//    }
//    return Future.delayed(const Duration(milliseconds: 2000), () {
//      setState(() {
//        Navigator.pushReplacementNamed(context, Units.id);
//        });
//    }); //@TODO UNCOMMENT THIS
  }
}
