import 'package:askarie/mvc/model/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/sizeConfig.dart';
import '../../model/apptheme.dart';
import '../../controller/materialController.dart';

class MaterialBox extends StatefulWidget {
  final color;
  final String materialName;
  const MaterialBox({@required this.color,@required this.materialName});
  @override
  _MaterialBoxState createState() => _MaterialBoxState();
}

class _MaterialBoxState extends State<MaterialBox> {
  Widget iconPlace =FaIcon(
    FontAwesomeIcons.arrowCircleLeft,
    size: SizeConfig.textMultiplier*5 ,
    color:Constant.C_White,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: GestureDetector(
        child: Container(
          height: SizeConfig.heightMultiplier * 10,
          decoration:
          AppTheme.MaterialUnitBoxContainer.copyWith(color: Constant.MaterialColorArray[widget.color]),
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
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                  child: iconPlace,
                ),
              ],
            ),
          ),
        ),
        onTap: (){
          MaterialController.openUnitPage(this,context);
          },
      ),
    );
  }
}
