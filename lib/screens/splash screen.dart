// packages
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:week_of_year/week_of_year.dart';

// Constent
import '../constent/Color.dart';
import '../constent/ImageName.dart';
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
    // Make Sure that their are internet Connection
    DownloadFile SplashScreenDownload = DownloadFile();
    Future connectionstate = SplashScreenDownload.internetConnection();
    connectionstate.then((value) async {
      if (!value) {
      } else {
        // Their is Internet Connection
        // Check the last time we download the File
        // Get this week number
        print("**** Internet Connected");
        final date = DateTime.now();
        var weekNum = date.weekOfYear;
        // is Their are a Downloaded file Before
        var lastcheckData = await localStorage.getData('Qata3alastcheckData');
        // Get this   DayNumber of day
        if ((lastcheckData + 3) >= weekNum) { // TODO change the compare sign to >

          // Data checked less than one month
          print("$lastcheckData XXx File Downloaded Before");
          // Go To the new page
          var AllMaterialFromlocal = await localStorage.getDataStringArray('Material');
          if(AllMaterialFromlocal!=0){
            print(AllMaterialFromlocal);
            print(AllMaterialFromlocal.length);
          }else{
            print('No Saved Material');
          }
        } else {
          // Data never Checked   or checked more than one month
          print("**** File not Downloaded");
          // Download the File
          Future DownloadState = SplashScreenDownload.downloadFile('http://joghaimi.com/mat.json', 'MaterialName.json'); //
          // Make Sure File is saved
          if (!SplashScreenDownload.ErrorDownload) {
            print("**** File No Error");

            // save data in the local Storage
            DownloadState.then((value) async {
              if (value) {
                // File Downloaded
                print("**** File Finished Downloaded");
                jsonToLocalStorage(); // Material To localStorage
                localStorage.saveData('Qata3alastcheckData', weekNum); // @ TODO uncomut this to save the date
                print('************ Finished');
              } else {

                print("**** File Feild to download ");
              }
            });
          } else {
            print("XXX IN ERROR Page ");
          }
        }
      }
    });

    return Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
//        Navigator.pushReplacementNamed(context, AllMaterial.id);
      });
    });
//    for (int i = 0; i < Units_Name.length; i++) {
//      Units.UnitScore[i] = await localStorage.getData(Units_Name[i]);
//    }
//    return Future.de3layed(const Duration(milliseconds: 2000), () {
//      setState(() {
//        Navigator.pushReplacementNamed(context, Units.id);
//        });
//    }); @TODO UNCOMMENT THIS
  }
}
