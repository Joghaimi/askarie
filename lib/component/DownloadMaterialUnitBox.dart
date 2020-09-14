// Packages
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Function
import '../function/RandomNum.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
              FaIcon(
                FontAwesomeIcons.arrowCircleDown,
                size: SizeConfig.textMultiplier *5 ,
                color:C_White,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
