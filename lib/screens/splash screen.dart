import 'package:flutter/material.dart';
// Constent
import '../constent/Color.dart';
import '../constent/ImageName.dart';
import '../constent/Text.dart';
import '../material/Units.dart';
// Functions
import '../function/localStorage.dart';
//Themes
import '../themes/AppTheme.dart';
import '../themes/size_config.dart';
//Screens
import 'units.dart';

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
              child: Container(
                color: C_Purple,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(""),
                      ),
                      Expanded(
                        flex: 9,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              K_camel,
                              width: 90 * SizeConfig.imageSizeMultiplier,
                            ),
                            Text(
                              AppName,
                              style: AppTheme.Titel.copyWith(
                                fontSize: 12 * SizeConfig.textMultiplier,
                                height: 0.4 * SizeConfig.heightMultiplier,
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
          ),
        );
      });
    });
  }

  Future<dynamic> OpenNewView() async {
    for (int i = 0; i < Units_Name.length; i++) {
      Units.UnitScore[i] = await localStorage.getData(Units_Name[i]);
    }

    return Future.delayed(const Duration(milliseconds: 4000), () {
      setState(() {
        Navigator.pushReplacementNamed(context, Units.id);
//        Navigator.pushReplacementNamed(context, MultibleChoise.id);
      });
    });
  }
}
