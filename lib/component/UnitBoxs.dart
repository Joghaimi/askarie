// packages
import 'package:askarie/constent/Color.dart';
import 'package:askarie/constent/Text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

//Function
import '../function/AllUnitFunction/saveQsinUnitArray.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';
// Screens
import '../screens/QuestionsAndAnswer.dart';
import '../screens/MultibleChoice.dart';
import '../screens/units.dart';

class UnitBoxs extends StatefulWidget {
  UnitBoxs(this.BoxTitel, this.Final_Score, this.NumerOfQestions,this.materialName,this.unitColor);
  final BoxTitel;
  final Final_Score;
  final NumerOfQestions;
  final materialName;
  final unitColor;
  var ahmad=5;
  var goData=0;
  //CheckBox State
  bool checkBoxVal =true;
  Widget iconPlace = Padding(
      padding: EdgeInsets.fromLTRB(SizeConfig.widthMultiplier * 7, 0,0,0),
      child: FaIcon(
        FontAwesomeIcons.arrowCircleLeft,
        size: SizeConfig.textMultiplier *5 ,
        color:C_White,
      )
  );
  Widget selectPlace = Text("");
  @override
  _UnitBoxsState createState() => _UnitBoxsState();
}

class _UnitBoxsState extends State<UnitBoxs> {
  var sizedBoxSie=SizeConfig.widthMultiplier * 8;
  @override
  Widget build(BuildContext context) {
    var color =MaterialColorArray[widget.unitColor];
    Widget selectMultibleChoiseQs= FaIcon(
      FontAwesomeIcons.questionCircle,
      size: SizeConfig.textMultiplier *6 ,
      color:color,
    );
    Widget SelectQsAndAns = FaIcon(
      FontAwesomeIcons.book,
      size: SizeConfig.textMultiplier *6 ,
      color:color,
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier  * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier  * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color: color),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Select Place
            widget.selectPlace,
            // Unit Name & Progress Bar
            Padding(
              padding:  EdgeInsets.fromLTRB(
                  SizeConfig.widthMultiplier * 3,
                  SizeConfig.heightMultiplier*1.2,
                  SizeConfig.widthMultiplier * 7,
                  0),
              child: Column(
                children: [
                  // MaterialName
                  Text(
                    widget.BoxTitel,
                    style: AppTheme.MaterialName,
                  ),
                  // ProgressBar
                  LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,
                    percent: ((100-widget.Final_Score)/ 100),
                    progressColor:   C_White,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ),
            Expanded(child: Text(""),),
            // Icons
            Row(
              mainAxisSize:  MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width:sizedBoxSie,),
                GestureDetector(
                    child: widget.iconPlace,
                    onTap:() {
                      setState(() {
                        widget.selectPlace=Text(""); // Hide Select Option
                        widget.iconPlace =  Container(
                            height: SizeConfig.heightMultiplier * 10,
                            width: 200,
                            decoration:AppTheme.MaterialUnitBoxContainer.copyWith(color: C_White),
                            child:Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.fromLTRB(
                                      SizeConfig.widthMultiplier * 3,
                                      0,
                                      SizeConfig.widthMultiplier * 8,
                                      0),
                                  child: GestureDetector(
                                    child: SelectQsAndAns,
                                    onTap: () async{
                                      // StopClicking
                                      // Show Toast
                                      Fluttertoast.showToast(
                                          msg: "Loading ..",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      // Get Data
                                      await getQuestion(widget.materialName,widget.BoxTitel );
                                      Navigator.pushNamed(context,QuestionsAndAnswer.id);
                                      // Go To QSAndAnsPage

                                    },
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.fromLTRB(
                                      SizeConfig.widthMultiplier * 3,
                                      0,
                                      SizeConfig.widthMultiplier * 7,
                                      0),
                                  child: GestureDetector(
                                    child: selectMultibleChoiseQs,
                                    onTap: () async{
                                      Fluttertoast.showToast(
                                          msg: "Loading ..",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      // Get Data
                                      await getQuestion(widget.materialName,widget.BoxTitel );
                                      MultibleChoise.materialName=widget.materialName;
                                      MultibleChoise.unitName=widget.BoxTitel;
                                      Navigator.pushNamed(context,MultibleChoise.id);

                                    },
                                  ),
                                ),
                              ],
                            )
                        );
                        sizedBoxSie=SizeConfig.widthMultiplier * 5;
                      });
                    }
                ),],
            ),

          ],
        ),
      ),
    );
  }
  void addToUnitsTestArray(var unitName){
    // Init Ads
    // Make Sure that is not exist
    if(!Units.selectedUnits.contains(unitName)){
      Units.selectedUnits.add(unitName);
    }
    // Show Instruction Toast
    Fluttertoast.showToast(
        msg: K_UnitTestSelect,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  void removeFromUnitTestArray(var unitName){
    // Make Sure that is exist
    if(Units.selectedUnits.contains(unitName)){
      Units.selectedUnits.remove(unitName);
      print(Units.selectedUnits);
    }
  }
}
