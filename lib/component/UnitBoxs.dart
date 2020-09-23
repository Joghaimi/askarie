// packages
import 'package:askarie/constent/Color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Function
import '../function/RandomNum.dart';
import '../function/AllUnitFunction/saveQsinUnitArray.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';
// Component
import 'ChoseOption.dart';
// Screens
import '../screens/units.dart';
import '../screens/QuestionsAndAnswer.dart';
import '../screens/MultibleChoice.dart';

class UnitBoxs extends StatefulWidget {
  UnitBoxs({this.BoxTitel, this.Final_Score, this.NumerOfQestions,this.circleColors});
  final BoxTitel;
  final Final_Score;
  final NumerOfQestions;
  final circleColors;
  var ahmad=5;
  Widget iconPlace =
  Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 7,
          0,
          0,
          0),
      child: FaIcon(
        FontAwesomeIcons.arrowCircleLeft,
        size: SizeConfig.textMultiplier *5 ,
        color:C_White,
      )
  );
  @override
  _UnitBoxsState createState() => _UnitBoxsState();
}

class _UnitBoxsState extends State<UnitBoxs> {
  var color =MaterialColorArray[RandomNum()];
  var sizedBoxSie=SizeConfig.widthMultiplier * 8;
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
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color: color),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(
                  SizeConfig.widthMultiplier * 3,
                  0,
                  SizeConfig.widthMultiplier * 7,
                  0),
              child: Text(
                widget.BoxTitel,
                style: AppTheme.MaterialName,
              ),
            ),
            Expanded(child: Text(""),),
            Row(
              mainAxisSize:  MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width:sizedBoxSie,),
                GestureDetector(
                    child: widget.iconPlace,
                    onTap:(){
                      setState(() {
                        widget.iconPlace = SelectoneOfTwoOption(color,'');
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

}

class SelectoneOfTwoOption extends StatefulWidget {
  const SelectoneOfTwoOption(this.color ,this.boxTitle) ;
  final  color;
  final boxTitle;
  @override
  _SelectoneOfTwoOptionState createState() => _SelectoneOfTwoOptionState();
}
class _SelectoneOfTwoOptionState extends State<SelectoneOfTwoOption> {
  @override
  Widget build(BuildContext context) {
    Widget selectMultibleChoiseQs= FaIcon(
      FontAwesomeIcons.questionCircle,
      size: SizeConfig.textMultiplier *6 ,
      color:this.widget.color,
    );
    Widget SelectQsAndAns = FaIcon(
      FontAwesomeIcons.book,
      size: SizeConfig.textMultiplier *6 ,
      color:this.widget.color,
    );
    return Container(
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
                onTap: (){
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
                  getQuestion("Math",widget.boxTitle);
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
                  // Go To MultibleCoise Page
                  setState(() {
                    SelectQsAndAns = Text("AHMD");
                    print("qhm");
                  });
                  await getQuestion("Math",'qrn');

                },
              ),
            ),
          ],
        )
    );
  }
}
// TODO Im here 15/9/2020
// Make Two Chose feature
/**
 * Make swip Effect
 * When Click on any of them do this
 *    - Make it loading icon
 *    - Get Database Data
 *    - Back it to the old icon
 *    - Go to selected page
 */

