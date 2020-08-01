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
import '../screens/QuestionsAndAnswer.dart';
import '../screens/MultibleChoice.dart';

// Function
import '../function/search.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
  var rs;
  var info;

  SearchResult(this.rs);
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.rs,
      child: Positioned(
        left: 0.0,
        top: 0.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.widthMultiplier * 6,
              3 * SizeConfig.heightMultiplier,
              SizeConfig.widthMultiplier * 2,
              3 * SizeConfig.heightMultiplier),
          child: Container(
            width: SizeConfig.widthMultiplier * 88,
            height: SizeConfig.heightMultiplier * 77,
            decoration: AppTheme.UnitBoxes,
            child: Padding(
              //all(12.0)
              padding: EdgeInsets.fromLTRB(
                  4 * SizeConfig.widthMultiplier,
                  2 * SizeConfig.heightMultiplier,
                  4 * SizeConfig.widthMultiplier,
                  2 * SizeConfig.heightMultiplier),
              child: ListView.builder(
                  itemCount: (Search.Result.length + 1),
                  itemBuilder: (BuildContext ctxt, int index) {
                    return index == 0
                        ? Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "نتائج البحث",
                                        style: AppTheme.UnitName,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.rs = false;
                                          Units.Search = false;
                                          MultibleChoise.Search = false;
                                          QuestionsAndAnswer.Search = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5 * SizeConfig.widthMultiplier,
                                ),
                              ],
                            ),
                          )
                        : SearchResultBox(Search.Result[index - 1]);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResultBox extends StatelessWidget {
  SearchResultBox(var this.result);

  final result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          3 * SizeConfig.widthMultiplier,
          3 * SizeConfig.heightMultiplier,
          3 * SizeConfig.widthMultiplier,
          1.5 * SizeConfig.heightMultiplier),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 44 * SizeConfig.widthMultiplier,
          height: 15 * SizeConfig.heightMultiplier,
          decoration: AppTheme.Answers,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                4 * SizeConfig.widthMultiplier,
                2 * SizeConfig.heightMultiplier,
                4 * SizeConfig.widthMultiplier,
                1.5 * SizeConfig.heightMultiplier),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Text(
                          result != null ? result[1] : "",
                          style: AppTheme.UnitScore.copyWith(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            height: 0.15 * SizeConfig.heightMultiplier,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 0.5 * SizeConfig.heightMultiplier, 0, 0),
                          child: Divider(
                            color: C_TextGray,
                            thickness: 0.2,
                          ),
                        ),
                        Text(
                          result != null ? result[result[6] + 1] : "",
                          style: AppTheme.UnitScore.copyWith(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            height: 0.15 * SizeConfig.heightMultiplier,
                          ),
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
    );
  }
}
