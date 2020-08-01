// packages
import 'package:askarie/constent/Color.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

// Component
import 'ChoseOption.dart';

class Answers extends StatefulWidget {
  const Answers(this.index, this.CircleFull, this.Answer, this.BoarderColor);

  final index;
  final Answer;
  final CircleFull;
  final BoarderColor;

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        4 * SizeConfig.widthMultiplier,
        1 * SizeConfig.heightMultiplier,
        4 * SizeConfig.widthMultiplier,
        1 * SizeConfig.heightMultiplier,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 40 * SizeConfig.widthMultiplier,
          height: 15 * SizeConfig.widthMultiplier,
          decoration: AppTheme.Answers.copyWith(
            border: Border.all(
              color: widget.BoarderColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 4, 4, 8),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Text(""),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.CircleFull,
                            border: Border.all(
                              width: 2,
                              color: C_Purple,
                            ),
                          ),
                        ),
                      ),
                      Expanded  (
                        child: AutoSizeText(
                          widget.Answer,
                          style: AppTheme.QestionAns,
//                          overflow: TextOverflow.ellipsis,
//                        child: Text(
//                          widget.Answer,
////                        style: AppTheme.QestionAns,
//                        ),
                        ),
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
