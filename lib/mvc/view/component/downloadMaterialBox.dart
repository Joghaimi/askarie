import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/apptheme.dart';
import '../../model/sizeConfig.dart';
import '../../model/constant.dart';
import '../../model/getRandom.dart';
import '../../controller/materialController.dart';

class DownloadMaterialBox extends StatefulWidget {
  final String materialName;
  const DownloadMaterialBox({@required this.materialName});
  @override
  _DownloadMaterialBoxState createState() => _DownloadMaterialBoxState();
}

class _DownloadMaterialBoxState extends State<DownloadMaterialBox> {
  Widget iconPlace = FaIcon(
    FontAwesomeIcons.arrowCircleDown,
    size: SizeConfig.textMultiplier *5 ,
    color:Constant.C_White,
  );
  bool onTabCondition=true;
  @override
  Widget build(BuildContext context) {
    var boxColor = Constant.MaterialColorArray[GetRandom.colorIndex()];
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color: boxColor),
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
                padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
                child: Text(
                  widget.materialName,
                  style: AppTheme.MaterialName,
                ),
              ),
              Expanded(child: Text(""),),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                  child: iconPlace,
                ),
                onTap:onTabCondition? ()async{
                  MaterialController.saveMaterial(this, context,widget.materialName);
                }:null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
