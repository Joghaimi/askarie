// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
// Constant
import 'package:askarie/constent/Color.dart';
// Component
import 'package:askarie/component/MyBottomAppBar.dart';
// Themes
import 'package:askarie/themes/size_config.dart';

class Home extends StatefulWidget {
  static final id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: C_Gray,
        width: 100 * SizeConfig.widthMultiplier,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(2 * SizeConfig.widthMultiplier,3 * SizeConfig.heightMultiplier,2 * SizeConfig.widthMultiplier,2 * SizeConfig.heightMultiplier),
              child: FlutterToggleTab(
                borderRadius: 20,
                height: 50,
                width: 20 * SizeConfig.widthMultiplier,
                initialIndex: 0,
                selectedBackgroundColors: [PrimaryColor],
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 2.3*SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w700),
                unSelectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 2*SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w500),
                labels: ["Tab A (10)", "Tab B (6)"],
                selectedLabelIndex: (index) {
                  print("Selected Index $index");
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  MyBottomAppBar(C_White),
    );
  }
}
