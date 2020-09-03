// packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Constant
import '../constent/Color.dart';
// Themes
import '../themes/size_config.dart';

class MyBottomAppBar extends StatefulWidget {
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
            SizeConfig.heightMultiplier *1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Expanded(
              // Home
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isSearching = !widget.isSearching;
                  });
                },
                child: FaIcon(
                    FontAwesomeIcons.home,
                    size: SizeConfig.textMultiplier*4 ,
                    color:C_White,
                ),
              ),
            ),
            Expanded(
              // Send request
              flex: 1,
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: SizeConfig.textMultiplier*4 ,
                color:C_White,
              ),
            ),
            Expanded(
              // search for other material
              flex: 1,
              child: FaIcon(
                FontAwesomeIcons.paperPlane,
                size: SizeConfig.textMultiplier*4 ,
                color:C_White,
              ),
            ),
            Expanded(
              // share
              flex: 1,
              child:FaIcon(
                FontAwesomeIcons.shareAlt,
                size: SizeConfig.textMultiplier*4 ,
                color:C_White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
