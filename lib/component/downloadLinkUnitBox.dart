// Packages
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Function
import '../function/RandomNum.dart';
import '../function/Home/DownloadandSaveLinkinDB.dart';
// Constant
import 'package:askarie/constent/Color.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

class DownloadLink extends StatefulWidget {
  final univName;
  final parent;
  const DownloadLink(this.parent,this.univName);
  @override
  _DownloadLinkState createState() => _DownloadLinkState();
}

class _DownloadLinkState extends State<DownloadLink> {
  @override
  Widget build(BuildContext context) {
    Widget IconPlace = FaIcon(
      FontAwesomeIcons.arrowCircleDown,
      size: SizeConfig.textMultiplier *5 ,
      color:C_White,
    );
    bool onTabCondition = true;
      return Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.widthMultiplier * 3,
            SizeConfig.heightMultiplier * 2,
            SizeConfig.widthMultiplier * 3,
            SizeConfig.heightMultiplier * 0.1),
        child: Container(
          height: SizeConfig.heightMultiplier * 10,
          decoration:
          AppTheme.MaterialUnitBoxContainer.copyWith(color: MaterialColorArray[1]),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.widthMultiplier * 1,
                SizeConfig.heightMultiplier * 1,
                SizeConfig.widthMultiplier * 0.1,
                SizeConfig.heightMultiplier * 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
                  child: Text(
                    widget.univName,
                    style: AppTheme.MaterialName,
                  ),
                ),
                Expanded(child: Text(""),),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                    child: IconPlace,
                  ),
                  onTap: (){
                    setState(() {IconPlace= ColoredCircularProgressIndicator();});
                    downloadLinkAndCreateTable(widget.parent,widget.univName);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

