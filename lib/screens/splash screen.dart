// packages
import 'package:flutter/material.dart';
//import 'package:loading_animations/loading_animations.dart';

// Constent
import '../constent/Color.dart';
import '../constent/Text.dart';

// Functions
import '../function/DealWithMaterial/LocalStorageSavedUnsavedMaterialpage.dart';
import '../function/SplashScreenFunction.dart';
import '../function/Notification/push_notification.dart';

//Themes
import '../themes/AppTheme.dart';
import '../themes/size_config.dart';

//Screens
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
      // initialise Notification
      PushNotificationService.initialise();
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
              color: C_Gray,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Text(""),
                    ),
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: <Widget>[
                          Text(
                            AppName,
                            style: AppTheme.Titel.copyWith(
                                fontSize: 25 * SizeConfig.textMultiplier,
                                height: 0.2 * SizeConfig.heightMultiplier,
                                color: PrimaryColor
                            ),
                          ),
                          Image.asset("images/Kewy.png",height: 10 * SizeConfig.textMultiplier,),
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
    checkForNewMaterial().then(
        (value) async{
          await localStorageSavedUnsavedMaterialPage();
          Navigator.pushReplacementNamed(context, AllMaterial.id);
        }
    );
  }
}
//                          LoadingDoubleFlipping.square(
//                            borderColor: C_White,
//                            backgroundColor: C_White,
//                            borderSize: 3.0 * SizeConfig.textMultiplier,
//                            size: 16 * SizeConfig.textMultiplier,
//                          ),
//                          Text(
//                            AppName,
//                            style: AppTheme.Titel.copyWith(
//                              fontSize: 12 * SizeConfig.textMultiplier,
//                              height: 0.3 * SizeConfig.heightMultiplier,
//                              color: PrimaryColor
//                            ),
//                          ),

