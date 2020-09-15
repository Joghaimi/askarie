// Packages
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
// Function
import '../function/RandomNum.dart';
// Function DataBase
import '../function/DealWithMaterial/downloadMaterialAndCreateTable.dart';
// Constant
import 'package:askarie/constent/Color.dart';

// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

class DownloadMaterialUnitBox extends StatefulWidget {
  final String materialName;

  const DownloadMaterialUnitBox(this.materialName);

  @override
  _DownloadMaterialUnitBoxState createState() => _DownloadMaterialUnitBoxState();

}

class _DownloadMaterialUnitBoxState extends State<DownloadMaterialUnitBox> {
  Widget IconPlace = FaIcon(
    FontAwesomeIcons.arrowCircleDown,
    size: SizeConfig.textMultiplier *5 ,
    color:C_White,
  );
  bool onTabCondition = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color: MaterialColorArray[RandomNum()]),
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
              Text(
                widget.materialName,
                style: AppTheme.MaterialName,
              ),
              SizedBox(width:SizeConfig.widthMultiplier * 8 ,),
              GestureDetector(
                child: IconPlace,
                onTap:onTabCondition? ()async{
                  // Start Downloading and Change the Icon
                  // -- ChangeIcon
                  setState(() {
                    IconPlace= ColoredCircularProgressIndicator();
                  });
                  // Disable The appilitty to click
                  onTabCondition=false;
                  var downloadState = await downloadMaterialAndCreateTable(widget.materialName);
                  // Open The New View
                  if(downloadState){
                    setState(() {
                      IconPlace= FaIcon(
                        FontAwesomeIcons.arrowCircleLeft,
                        size: SizeConfig.textMultiplier *5 ,
                        color:C_White,
                      );
                    });
                  }
                  // Enable The Click again
                }:null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}