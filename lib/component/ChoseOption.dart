// packages
import 'package:askarie/themes/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constant
import '../constent/Color.dart';
import '../constent/Text.dart';

// themes
import '../themes/size_config.dart';

// Screens
import '../screens/units.dart';
import '../screens/MultibleChoice.dart';
import '../screens/QuestionsAndAnswer.dart';

class ChoseOption extends StatefulWidget {
  var State;

  ChoseOption(this.State);

  @override
  _ChoseOptionState createState() => _ChoseOptionState();
}

class _ChoseOptionState extends State<ChoseOption> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.State,
      child: Positioned(
          left: 0.0,
          top: 0.0,
          child: new Container(
            width: SizeConfig.widthMultiplier * 100,
            height: SizeConfig.heightMultiplier * 100,
            decoration: new BoxDecoration(color: C_Gray.withOpacity(0.87)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.heightMultiplier * 35,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Container(
                    decoration: AppTheme.UnitBoxes,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Units.state=false;
                                  widget.State=false;
                                  print(Units.state);
                                  Navigator.pushNamed(
                                      context, MultibleChoise.id);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    K_MultiChoise,
                                    style: AppTheme.SelectType,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Units.state=false;
                                  widget.State=false;
                                  Navigator.pushNamed(
                                      context, QuestionsAndAnswer.id);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    K_QuestionsAndAnswer,
                                    style: AppTheme.SelectType,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
