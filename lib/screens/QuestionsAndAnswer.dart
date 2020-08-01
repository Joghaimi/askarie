// Packages
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// Component
import '../component/Button.dart';
import '../component/SearchResult.dart';

// Constant
import '../constent/Color.dart';
import '../constent/Text.dart';

// themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

// Screens
import '../screens/units.dart';

// Units
import '../material/Units.dart';

// Function
import '../function/search.dart';

// Screens
class QuestionsAndAnswer extends StatefulWidget {
  static final id = "QuestionsAndAnswer";
  static var Search = false;
  static var isSearching = false;
  var QestionsNumber = 0;
  var SelectedAnswer = 0;
  var BorderColor = [
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300]
  ];
  var correctAns = 0;
  var Score = 0;

  @override
  _QuestionsAndAnswerState createState() => _QuestionsAndAnswerState();
}

class _QuestionsAndAnswerState extends State<QuestionsAndAnswer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          setState(() {
            if(!QuestionsAndAnswer.Search){
              Navigator.pop(context);
            }else{
              QuestionsAndAnswer.Search=false;
            }
          });
        },
        child: Scaffold(
          body: Container(
            color: C_Gray,
            child: Column(
              children: <Widget>[
                Container(
                  height: 8*SizeConfig.heightMultiplier,
                  color: C_Purple,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              QuestionsAndAnswer.isSearching =
                                  !QuestionsAndAnswer.isSearching;
                            });
                          },
                          child: Icon(
                            !QuestionsAndAnswer.isSearching
                                ? Icons.search
                                : Icons.cancel,
                            color: Colors.white,
                            size: !QuestionsAndAnswer.isSearching ? 50 : 30,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: QuestionsAndAnswer.isSearching
                            ? TextField(
                                autofocus: true,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                onSubmitted: (String search) {
                                  Search.Result.clear();
                                  if (search.isNotEmpty) {
                                    Search.search(search);
                                    setState(() {
                                      QuestionsAndAnswer.Search = true;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "احمد يبحث",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Text(""),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            !QuestionsAndAnswer.isSearching ? AppName : "",
                            style: AppTheme.Titel.copyWith(
                              fontSize: 3.5 * SizeConfig.textMultiplier,
                              height: 0.15 * SizeConfig.heightMultiplier,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                      child: Container(
                        height: SizeConfig.heightMultiplier * 87,
                        decoration: AppTheme.UnitBoxes,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(4*SizeConfig.widthMultiplier, 12*SizeConfig.widthMultiplier, 4*SizeConfig.widthMultiplier, 8*SizeConfig.widthMultiplier),
                              child: Container(
                                width: 40 * SizeConfig.widthMultiplier,
                                height: 40 * SizeConfig.widthMultiplier,
                                child: Center(
                                  child: Text(
                                    UnitsArray[Units.Unit_id][widget.QestionsNumber]
                                        [1],
                                    style: AppTheme.Question,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.fromLTRB(4*SizeConfig.widthMultiplier, 0, 4*SizeConfig.widthMultiplier, 0),
                              child: StepProgressIndicator(
                                totalSteps: UnitsArray[Units.Unit_id].length - 1,
                                currentStep: widget.QestionsNumber,
                                size: 8,
                                padding: 0,
                                selectedColor: C_Purple,
                                unselectedColor: Colors.grey[200],
                                roundedEdges: Radius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 7*SizeConfig.heightMultiplier,
                            ),
                            Padding(
                              padding:EdgeInsets.fromLTRB(4*SizeConfig.heightMultiplier, 8*SizeConfig.heightMultiplier, 4*SizeConfig.heightMultiplier, 4*SizeConfig.heightMultiplier),
                              child: Text(
                                UnitsArray[Units.Unit_id][widget.QestionsNumber][1+UnitsArray[Units.Unit_id][widget.QestionsNumber][6]],
                                style: AppTheme.QestionsAndAnswersText,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Expanded(
                              child: Text(""),
                            ),
                            Button("التالي", () {
                              setState(() {
                                if (widget.QestionsNumber <
                                    (UnitsArray[Units.Unit_id].length - 1)) {
                                  widget.QestionsNumber++;
                                } else {
                                  Units.Unit_id = 0;
                                  Navigator.pop(context);
                                }
                              });
                            }),
                            Expanded(
                              child: Text(""),
                            ),

                            // @ToDo ADD Ads  Here
                            // @ToDo Make A function That Show Add each number of clicks {Try To make it Random}
                          ],
                        ),
                      ),
                    ),
                    SearchResult(QuestionsAndAnswer.Search),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
