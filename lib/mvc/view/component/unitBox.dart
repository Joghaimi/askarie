import 'package:askarie/mvc/controller/unitScreenController.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/sizeConfig.dart';
import '../../model/apptheme.dart';
import '../../model/constant.dart';

class UnitBox extends StatefulWidget {
   final String unitName;
   final int unitIndex;
   final int progress;
   final int color;
   const UnitBox({@required this.unitName,@required this.unitIndex,@required this.progress,@required this.color});
   @override
  _UnitBoxState createState() => _UnitBoxState();
}

class _UnitBoxState extends State<UnitBox> {
  double sizedBoxSie=SizeConfig.widthMultiplier * 8;
  double textPlaceSize =  SizeConfig.widthMultiplier*60;
  Widget iconPlace = Padding(
      padding: EdgeInsets.fromLTRB(SizeConfig.widthMultiplier * 7, 0,0,0),
      child: FaIcon(
        FontAwesomeIcons.arrowCircleLeft,
        size: SizeConfig.textMultiplier *5 ,
        color:Constant.C_White,
      )
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier  * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier  * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration: AppTheme.MaterialUnitBoxContainer.copyWith(color:Constant.MaterialColorArray[widget.color]),
        child:Padding(
          padding: EdgeInsets.fromLTRB(0, 0,SizeConfig.widthMultiplier * 7,0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: textPlaceSize,
                child: AutoSizeText(
                  widget.unitName,
                  style: AppTheme.MaterialName,
                  maxLines: 1,
                ),
              ),
              SizedBox(width: this.sizedBoxSie,),
              GestureDetector(
                  child: this.iconPlace,
                  onTap: (){
                    setState(() {
                      this.textPlaceSize =SizeConfig.widthMultiplier*40;
                      this.iconPlace = UnitScreenController.returnChoiceOption(parent: this, color: Constant.MaterialColorArray[widget.color]);
                    });

                  },
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
