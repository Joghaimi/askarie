import 'package:askarie/constent/Color.dart';
import 'package:askarie/screens/MultibleChoice.dart';
import 'package:askarie/screens/units.dart';
import 'package:askarie/themes/AppTheme.dart';
import 'package:askarie/themes/size_config.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class QuestionPart extends StatelessWidget {
  const QuestionPart({
    Key key,
    @required this.widget,
  }) : super(key: key);
  final MultibleChoise widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: C_White,
      child: Column(
        children: [
          // For QS Text
          Container(
            width: 90 * SizeConfig.widthMultiplier,
            height: 40 * SizeConfig.widthMultiplier,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 12,
                  child: Align(
                    alignment: Alignment.center,
                    child : AutoDirection(
                      text: Units.questionsArray[widget.QestionsNumber][0],
                      child: AutoSizeText(
                        Units.questionsArray[widget.QestionsNumber][0],
                        style: AppTheme.SmallSizeText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: C_Gray,
            thickness: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                4 * SizeConfig.widthMultiplier,
                4 * SizeConfig.widthMultiplier,
                4 * SizeConfig.widthMultiplier,
                0),
            child: Row(
              children: [
                Expanded(
                  child: StepProgressIndicator(
                    totalSteps: Units.questionNumber,
                    currentStep: widget.QestionsNumber,
                    size: 12,
                    padding: 0,
                    selectedColor: C_Purple,
                    unselectedColor: Colors.grey[200],
                    roundedEdges: Radius.circular(10),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "الوقت",
                      style: AppTheme
                          .smallerSizeText, // TODO Add Timer Start From the time you enterded the Quiez
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 4 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}