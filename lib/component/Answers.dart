// packages
import 'package:askarie/constent/Color.dart';
import 'package:auto_direction/auto_direction.dart';
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
  var textDirection =TextDirection.ltr;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, SizeConfig.heightMultiplier * 0.5),
      child: Container(
        width: 100 * SizeConfig.widthMultiplier,
        child: Directionality(
          textDirection: textDirection,
          child: Container(
            width: 40 * SizeConfig.widthMultiplier,
            height: 9.5 * SizeConfig.heightMultiplier,
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
                          padding: EdgeInsets.fromLTRB(1.6* SizeConfig.widthMultiplier, 0.4*SizeConfig.heightMultiplier, 0.4 * SizeConfig.widthMultiplier, 0.8*SizeConfig.heightMultiplier),
                          child: Container(
                            width:  4.5* SizeConfig.widthMultiplier,
                            height: 4.5* SizeConfig.widthMultiplier,
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoDirection(
                                text: widget.Answer,
                                child: AutoSizeText(
                                  widget.Answer,
                                  style: AppTheme.QestionAns,
                                ),
                              ),
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
      ),
    );
  }
}
