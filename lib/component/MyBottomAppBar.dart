// packages
import 'package:askarie/constent/Text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';

// Constant
import '../constent/Color.dart';

// Themes
import '../themes/size_config.dart';

// Function
import '../function/saverandomdata.dart';
import '../function/shareApp.dart';

// Screens
import 'package:askarie/screens/units.dart';


class MyBottomAppBar extends StatefulWidget {
  MyBottomAppBar(this.colors);

  final colors;
  bool isSearching = false;

  @override
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 8.5,
      color: PrimaryColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.widthMultiplier * 0.5,
            SizeConfig.heightMultiplier * 1.5,
            SizeConfig.widthMultiplier * 11,
            SizeConfig.heightMultiplier * 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Expanded(
              // Home
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  await saveRandomData();
                  print("what now ? ");
                  setState(() {
//                    widget.isSearching = !widget.isSearching;
                  });
                },
                child: FaIcon(
                  FontAwesomeIcons.home,
                  size: SizeConfig.textMultiplier * 4,
                  color: C_White,
                ),
              ),
            ),
            Expanded(
              // search for other material
              flex: 1,
              child: GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.feather,
                  size: SizeConfig.textMultiplier * 4,
                  color: widget.colors,
                ),
                onTap: () {
                  if(Units.selectedUnits.length > 0){ // Test Selected
                    Fluttertoast.showToast(
                        msg: K_Loading,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }else{
                    Fluttertoast.showToast(
                        msg: K_PSelectUnits,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );


                  }
                },
              ),
            ),
            Expanded(
              // Send request
              flex: 1,
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: SizeConfig.textMultiplier * 4,
                color: C_White,
              ),
            ),
            Expanded(
              // share
              flex: 1,
              child: GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.shareAlt,
                  size: SizeConfig.textMultiplier * 4,
                  color: C_White,
                ),
                onTap: () => shareApp(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
