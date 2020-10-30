// packages
import 'package:askarie/constent/UniName.dart';
import 'package:askarie/function/Home/localStorageSavedUnsavedLink.dart';
import 'package:flutter/material.dart';
import 'package:select_dialog/select_dialog.dart';
// Constent
import '../constent/Color.dart';
import '../constent/Text.dart';
// Functions
import '../function/localStorage.dart';
import '../function/DealWithMaterial/LocalStorageSavedUnsavedMaterialpage.dart';
import '../function/SplashScreenFunction.dart';
import '../function/Notification/push_notification.dart';
import '../function/Home/checkForNewLink.dart';
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
  void initState(){
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
   OpenNewView() async {
    var theFirstRun=await firstRun();
    if(theFirstRun == 0){ // First Run
      // Select the Uni
      String UNI = "";
      SelectDialog.showModal<String>(
        context,
        label: "اختيار الجامعه",
        selectedValue: UNI,
        items: uniName,
        onChange: (String selected) {
          setState(() {
            UNI = selected;
            print(UNI);
              //Save it IN Local Storage
            localStorage.SaveString("UNIName",UNI).then(
              // Get Data
                checkForNewMaterial().then(
                        (value) async{
                      await localStorageSavedUnsavedMaterialPage();
                      saveUniLink();
                      Navigator.pushReplacementNamed(context, AllMaterial.id);
//                      checkForNewLink().then(
//                              (value){
//                            localStorageSavedUnsavedLink();
//                            // Save Links
//                            saveUniLink();
//                            Navigator.pushReplacementNamed(context, AllMaterial.id);
//                          }
//                      );
                    }
                )
            );
          })
          ;
        },
      );
    }else{
      checkForNewMaterial().then(
              (value) async{
            await localStorageSavedUnsavedMaterialPage();
//            saveUniLink();
            Navigator.pushReplacementNamed(context, AllMaterial.id);
          }
      );
    }

  }
}

