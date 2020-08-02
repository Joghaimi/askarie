// packages
import 'package:askarie/constent/Color.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


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
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 90 * SizeConfig.widthMultiplier,
          height: 20 * SizeConfig.widthMultiplier,
          decoration: AppTheme.UnitBoxes,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(0.2*SizeConfig.widthMultiplier, 0.5*SizeConfig.heightMultiplier, 0.2*SizeConfig.widthMultiplier, 0.5*SizeConfig.heightMultiplier),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:  EdgeInsets.fromLTRB(2*SizeConfig.widthMultiplier, 0.8*SizeConfig.heightMultiplier, 1.2*SizeConfig.widthMultiplier, 0.8*SizeConfig.heightMultiplier),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Text(""),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.circleColors,
                            border: Border.all(
                              width: 2,
                              color: C_Purple,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          widget.BoxTitel,
                          style: AppTheme.UnitName.copyWith(color: C_TextGray_Deep),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 5*SizeConfig.widthMultiplier, 0),
                        child: Text(
                          widget.NumerOfQestions,
                          style: AppTheme.UnitScore.copyWith(color: C_TextGray),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                        child: VerticalDivider(
                          color: C_TextGray_Deep,
                          thickness: 1.5,
                        ),
                      ),
                      Text(
                        widget.Final_Score,
                        style: AppTheme.UnitScore.copyWith(color: C_TextGray),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
