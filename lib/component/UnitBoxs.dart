// packages
import 'package:askarie/constent/Color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
//Function
import '../function/RandomNum.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

// Component
import 'ChoseOption.dart';

class UnitBoxs extends StatefulWidget {
  UnitBoxs({this.BoxTitel, this.Final_Score, this.NumerOfQestions,this.circleColors});
  final BoxTitel;
  final Final_Score;
  final NumerOfQestions;
  final circleColors;

  @override
  _UnitBoxsState createState() => _UnitBoxsState();
}

class _UnitBoxsState extends State<UnitBoxs> {

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
                widget.BoxTitel,
                style: AppTheme.MaterialName,
              ),
              SizedBox(width:SizeConfig.widthMultiplier * 8 ,),
              GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.arrowCircleLeft,
                  size: SizeConfig.textMultiplier *5 ,
                  color:C_White,
                ),
                onTap:(){}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// TODO Im here 15/9/2020
// Make Two Chose feature
// make it like adobe XD
//Padding(
//      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//      child: Directionality(
//        textDirection: TextDirection.rtl,
//        child: Container(
//          width: 90 * SizeConfig.widthMultiplier,
//          height: 20 * SizeConfig.widthMultiplier,
//          decoration: AppTheme.UnitBoxes,
//          child: Padding(
//            padding:  EdgeInsets.fromLTRB(0.2*SizeConfig.widthMultiplier, 0.5*SizeConfig.heightMultiplier, 0.2*SizeConfig.widthMultiplier, 0.5*SizeConfig.heightMultiplier),
//            child: Row(
//              mainAxisSize: MainAxisSize.max,
//              textDirection: TextDirection.rtl,
//              children: <Widget>[
//                Expanded(
//                  flex: 3,
//                  child: Row(
//                    children: <Widget>[
//                      Padding(
//                        padding:  EdgeInsets.fromLTRB(2*SizeConfig.widthMultiplier, 0.8*SizeConfig.heightMultiplier, 1.3*SizeConfig.widthMultiplier, 0.8*SizeConfig.heightMultiplier),
//                        child: Container(
//                          width: 6*SizeConfig.widthMultiplier,
//                          height: 6*SizeConfig.widthMultiplier,
//                          child: Text(""),
//                          decoration: BoxDecoration(
//                            shape: BoxShape.circle,
//                            color: widget.circleColors,
//                            border: Border.all(
//                              width: 2,
//                              color: C_Purple,
//                            ),
//                          ),
//                        ),
//                      ),
//                      Expanded(
//                        child: AutoSizeText(
//                          widget.BoxTitel,
//                          style: AppTheme.UnitName.copyWith(color: C_TextGray_Deep),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Row(
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.fromLTRB(1.2*SizeConfig.widthMultiplier, 0, 5*SizeConfig.widthMultiplier, 0),
//                        child: Text(
//                          widget.NumerOfQestions,
//                          style: AppTheme.UnitScore.copyWith(color: C_TextGray),
//                        ),
//                      ),
//                      Padding(
//                        padding:  EdgeInsets.fromLTRB(0, 2.5*SizeConfig.heightMultiplier, 0, 2.5*SizeConfig.heightMultiplier),
//                        child: VerticalDivider(
//                          color: C_TextGray_Deep,
//                          thickness: 1.5,
//                        ),
//                      ),
//                      Text(
//                        widget.Final_Score,
//                        style: AppTheme.UnitScore.copyWith(color: C_TextGray),
//                      ),
//
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );