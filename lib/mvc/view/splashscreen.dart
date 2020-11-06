import 'package:flutter/material.dart';
import '../model/sizeConfig.dart';
import '../model/constant.dart';
import '../model/apptheme.dart';
class SplashScreen extends StatefulWidget {
  static final id = 'splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Container(
          child: Scaffold(
            body: Container(
              color: Constant.C_Gray,
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
                            Constant.AppName,
                            style: AppTheme.Titel.copyWith(
                                fontSize: 25 * SizeConfig.textMultiplier,
                                height: 0.2 * SizeConfig.heightMultiplier,
                                color: Constant.PrimaryColor
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
}
