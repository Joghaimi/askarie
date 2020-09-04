import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

// Constent
import '../constent/Color.dart';
import '../constent/ImageName.dart';
import '../constent/Text.dart';
import '../material/Units.dart';

// Functions
import '../function/localStorage.dart';
import '../function/DealWithMaterial/downloadFile.dart';

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
                            borderSize: 3.0* SizeConfig.textMultiplier,
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
    SplashScreenDownload.internetConnection();
    if(!SplashScreenDownload.internetConnectionsta){
      // No InternetConnection
    }else{
      // Their is Internet Connection
         // Check the last time we download the File
            // is Their are a Downloaded file Before
    }

    return Future.delayed(const Duration(milliseconds: 200), () {
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
//    }); @TODO UNCOMMENT THIS
  }
}
