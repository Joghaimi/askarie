// packages
import 'package:askarie/constent/Text.dart';
import 'package:askarie/function/AllUnitFunction/selectedUnitTest.dart';
import 'package:askarie/function/Home/readWriteLinks.dart';
import 'package:askarie/screens/AllMaterial.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Constant
import '../constent/Color.dart';

// Themes
import '../themes/size_config.dart';

// Function
import '../function/shareApp.dart';

// Screens
import 'package:askarie/screens/units.dart';
import 'package:askarie/screens/MultibleChoice.dart';
import 'package:askarie/screens/home.dart';

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
              child: GestureDetector(
                onTap: (){
                  Navigator.popAndPushNamed(context, AllMaterial.id);    // Navigate to Home Page
                },
                child: FaIcon(
                  FontAwesomeIcons.home,
                  size: SizeConfig.textMultiplier * 4,
                  color: C_White,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  var linkArray = await readLinks("private");      // Read Links in DB
                  var publicLinkArray = await readLinks("public"); // Save LinkArray in home privetLink
                  Home.privetLink.clear();                         // Remove all link inside the array
                  Home.publicLink.clear();                         // Remove all link inside the array
                  for (var link in linkArray) {
                    var addLink = [link['LinkName'], link['LinkURL']];
                    Home.privetLink.add(addLink);
                  }
                  for (var link in publicLinkArray) {
                    var addLink = [link['LinkName'], link['LinkURL']];
                    Home.publicLink.add(addLink);
                  }
                  Navigator.popAndPushNamed(context, Home.id);    // Navigate to Home Page
                },
                child: FaIcon(
                  FontAwesomeIcons.link,
                  size: SizeConfig.textMultiplier * 4,
                  color: C_White,
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.feather,
                  size: SizeConfig.textMultiplier * 4,
                  color: widget.colors,
                ),
                onTap: () async {
                  if (Units.selectedUnits.length > 0) {  // Test Selected
                    Fluttertoast.showToast(
                        msg: K_Loading,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    await selectedUnitTest().then((val) {
                      Navigator.pushNamed(context, MultibleChoise.id);
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: K_PSelectUnits,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              ),
            ),
// USE THIS https://pub.dev/packages/searchable_dropdown
//            Expanded(
//              // Search
//              // Send request
//              flex: 1,
//              child: FaIcon(
//                FontAwesomeIcons.search,
//                size: SizeConfig.textMultiplier * 4,
//                color: C_White,
//              ),
//            ),
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
