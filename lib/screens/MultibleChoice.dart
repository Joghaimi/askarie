// Packages
import 'package:auto_direction/auto_direction.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ADS
import 'package:firebase_admob/firebase_admob.dart';
import '../function/ads.dart';

// Component
import '../component/Answers.dart';
import '../component/Button.dart';

// Constant
import '../constent/Color.dart';
import '../constent/Text.dart';

// themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

// Screens
import '../screens/units.dart';

// Function
import '../function/DealWithMaterial/getSetScore.dart';

class MultibleChoise extends StatefulWidget {
  //  ADMOB
  static final id = "MultibleChoise";
  // For Save Score
  static var materialName;
  static var unitName;
  // For Save Score


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
  bool savebtn = true;
  bool nextBtn = false;

  //Static Var All QS
  // Unit From Material
  static var QSNumber = 0;
  static var QS = new List(100);

  @override
  _MultibleChoiseState createState() => _MultibleChoiseState();
}

class _MultibleChoiseState extends State<MultibleChoise> {
  final ahmdaAds = ADS();
  InterstitialAd MultibleChoiseAds;
  BannerAd MultibleChoiseBannerAds;

  @override
  void initState() {

    WidgetsFlutterBinding.ensureInitialized();
    FirebaseAdMob.instance.initialize(
        appId:
            'ca-app-pub-9661386178168248~7055214624'); //ca-app-pub-9661386178168248~2297648329
    MultibleChoiseAds = ahmdaAds.getNewInterstital();
    MultibleChoiseBannerAds = ahmdaAds.getNewBannerAd();
    MultibleChoiseAds.load();
    MultibleChoiseBannerAds.load();
    super.initState();
  }

  @override
  void dispose() {
    MultibleChoiseBannerAds.dispose();
    super.dispose();
  }

// TODO ADD Shadow
  @override
  Widget build(BuildContext context) {
    MultibleChoiseBannerAds.show();
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: C_Gray,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                  4 * SizeConfig.widthMultiplier,
                  4 * SizeConfig.heightMultiplier,
                  4 * SizeConfig.widthMultiplier,
                  1 * SizeConfig.heightMultiplier,
                ),
                child: Column(
                  children: <Widget>[
                    QuestionPart(
                      widget: widget,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, SizeConfig.heightMultiplier * 0.5),
                        child: Container(
                          width: 100 * SizeConfig.widthMultiplier,
                          child: Answers(
                              1,
                              C_Purpel_Color[0],
                              Units.questionsArray[widget.QestionsNumber][1],
                              widget.BorderColor[0]),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.SelectedAnswer = 1;
                          C_Purpel_Color[0] = C_Purple;
                          C_Purpel_Color[1] = C_White;
                          C_Purpel_Color[2] = C_White;
                          C_Purpel_Color[3] = C_White;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, SizeConfig.heightMultiplier * 0.5),
                        child: Container(
                          width: 100 * SizeConfig.widthMultiplier,
                          child: Answers(
                              2,
                              C_Purpel_Color[1],
                              Units.questionsArray[widget.QestionsNumber][2],
                              widget.BorderColor[1]),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.SelectedAnswer = 2;
                          C_Purpel_Color[0] = C_White;
                          C_Purpel_Color[1] = C_Purple;
                          C_Purpel_Color[2] = C_White;
                          C_Purpel_Color[3] = C_White;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, SizeConfig.heightMultiplier * 0.5),
                        child: Container(
                          width: 100 * SizeConfig.widthMultiplier,
                          child: Answers(
                              3,
                              C_Purpel_Color[2],
                              Units.questionsArray[widget.QestionsNumber][3],
                              widget.BorderColor[2]),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.SelectedAnswer = 3;
                          C_Purpel_Color[0] = C_White;
                          C_Purpel_Color[1] = C_White;
                          C_Purpel_Color[2] = C_Purple;
                          C_Purpel_Color[3] = C_White;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, SizeConfig.heightMultiplier * 0.5),
                        child: Container(
                          width: 100 * SizeConfig.widthMultiplier,
                          child: Answers(
                              4,
                              C_Purpel_Color[3],
                              Units.questionsArray[widget.QestionsNumber][4],
                              widget.BorderColor[3]),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.SelectedAnswer = 4;
                          C_Purpel_Color[0] = C_White;
                          C_Purpel_Color[1] = C_White;
                          C_Purpel_Color[2] = C_White;
                          C_Purpel_Color[3] = C_Purple;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, SizeConfig.heightMultiplier * 0.5, 0, 0),
                      child: Row(
                        children: [
                          // Save
                          Button(K_NextQs, () {
                            setState(() {
                              nextQs();
                            });
                          }, C_Gray, AppTheme.ButtonNext, widget.nextBtn),
                          SizedBox(
                            width: 3 * SizeConfig.widthMultiplier,
                          ),
                          Button(K_Save, () {
                            setState(() {
                              saveAns();
                            });
                          }, C_Purple, AppTheme.Button, widget.savebtn),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextQs() {
    // Reset Border Color And Ball Color && Reset widget.SelectedAnswer
    setState(() {
      widget.BorderColor = [
        Colors.grey[400],
        Colors.grey[400],
        Colors.grey[400],
        Colors.grey[400]
      ];
      // Reset Circle Color
      C_Purpel_Color[0] = C_White;
      C_Purpel_Color[1] = C_White;
      C_Purpel_Color[2] = C_White;
      C_Purpel_Color[3] = C_White;
      // Reset widget.SelectedAnswer
      widget.SelectedAnswer = 0;
      // Go To next Qs
      if (widget.QestionsNumber < (Units.questionNumber - 1)) {
        // Disable NextBtn
        widget.nextBtn=false;
        // Enable Save Btn
        widget.savebtn=true;
        // Go to next Qs
        widget.QestionsNumber++;
      }else{
        var score =(widget.Score/Units.questionNumber)*100;
        // Save Score In localStorage
        setUnitScore(MultibleChoise.materialName,MultibleChoise.unitName,score.floor());
        Fluttertoast.showToast(
            msg: "Your Score is ${score.toInt()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: score > 40 ? Colors.green : Colors.red[500],
            textColor: Colors.white,
            fontSize: 16.0
        );
        widget.Score = 0;
        widget.QestionsNumber = 0;
        Units.Unit_id = 0;
        MultibleChoiseAds.show(); //not sowing
        Navigator.pop(context);
      }
    });
  }

  void saveAns() {
    // Do nothing id no selected Ans
    if (widget.SelectedAnswer == 0) {
      return;
    }
    // Get the correct Ans
    widget.correctAns = Units.questionsArray[widget.QestionsNumber][5];
    // If correct ans > 4 then make it 4
    widget.correctAns = widget.correctAns<4?widget.correctAns:4;
    // Change Colors and make btn UnClickable
    setState(() {
      // But Red Color in the Selected Ans
      widget.BorderColor[widget.SelectedAnswer - 1] = Colors.red[500];
      // But Green Color in the Right Ans
      widget.BorderColor[widget.correctAns - 1] = Colors.green;
      widget.savebtn = false;
    });
    // Calculate Score
    if (widget.correctAns == widget.SelectedAnswer) {
      widget.Score++;
    }
    // Enable Next Btn
    setState(() {
      widget.nextBtn = true;
    });

  }
}
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

//                    child: AutoSizeText(
//                      Units.questionsArray[widget.QestionsNumber][0],
//                      style: AppTheme.SmallSizeText,
//                    ),
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

// Fix BannerAd problem

//              Container(
//              height: 8*SizeConfig.heightMultiplier,
//              color: C_Purple,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
////                  Expanded(
////                    flex: 1,
////                    child: GestureDetector(
////                      onTap: () {
////                        setState(() {MultibleChoise.isSearching = !MultibleChoise.isSearching;});
////                      },
////                      child: Icon(
////                        !MultibleChoise.isSearching ? Icons.search : Icons.cancel,
////                        color: Colors.white,
////                        size: !MultibleChoise.isSearching ? 7*SizeConfig.textMultiplier : 4*SizeConfig.textMultiplier,
////                      ),
////                    ),
////                  ),
////                  Expanded(
////                    flex: 3,
////                    child: MultibleChoise.isSearching
////                        ? TextField(
////                      autofocus: true,
////                      textDirection: TextDirection.rtl,
////                      textAlign: TextAlign.center,
////                      style: TextStyle(color: Colors.white),
////                      onSubmitted: (String search){
////                        Search.Result.clear();
////                        if(search.isNotEmpty){
////                          Search.search(search);
////                          setState(() {
////                            MultibleChoise.Search =true;
////                          });
////                        }
////
////
////                      },
////                      decoration: InputDecoration(
////                        hintText: "يبحث",
////                        hintStyle: TextStyle(
////                          fontSize: 2.2*SizeConfig.textMultiplier,
////                          color: Colors.white,
////                        ),
////
////                      ),
////                    )
////                        : Text(""),
////                  ),
////                  Expanded(
////                    flex: 1,
////                    child: Padding(
////                      padding:  EdgeInsets.fromLTRB(0, 1.2*SizeConfig.heightMultiplier, 0, 0),
////                      child: Text(
////                        !MultibleChoise.isSearching ? AppName : "",
////                        style: AppTheme.Titel.copyWith(
////                          fontSize: 3.5 * SizeConfig.textMultiplier,
////                          height: 0.15 * SizeConfig.heightMultiplier,
////                        ),
////                      ),
////                    ),
////                  ),
//                ],
//              ),
//            ),
//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      mainAxisSize: MainAxisSize.max,
//                      children: <Widget>[
//                        GestureDetector(
//                          child: Answers(
//                              1,
//                              C_Purpel_Color[0],
//                              Units.questionsArray[widget.QestionsNumber][1],
//                              widget.BorderColor[0]),
//                          onTap: () {
//                            setState(() {
//                              widget.SelectedAnswer = 1;
//                              C_Purpel_Color[0] = C_Purple;
//                              C_Purpel_Color[1] = C_White;
//                              C_Purpel_Color[2] = C_White;
//                              C_Purpel_Color[3] = C_White;
//                            });
//                          },
//                        ),
//                        GestureDetector(
//                          child: Answers(
//                              2,
//                              C_Purpel_Color[1],
//                              Units.questionsArray[widget.QestionsNumber][2],
//                              widget.BorderColor[1]),
//                          onTap: () {
//                            setState(() {
//                              widget.SelectedAnswer = 2;
//                              C_Purpel_Color[0] = C_White;
//                              C_Purpel_Color[1] = C_Purple;
//                              C_Purpel_Color[2] = C_White;
//                              C_Purpel_Color[3] = C_White;
//                            });
//                          },
//                        ),
//                        GestureDetector(
//                          child: Answers(
//                              3,
//                              C_Purpel_Color[2],
//                              Units.questionsArray[widget.QestionsNumber][3],
//                              widget.BorderColor[2]),
//                          onTap: () {
//                            setState(() {
//                              widget.SelectedAnswer = 3;
//                              C_Purpel_Color[0] = C_White;
//                              C_Purpel_Color[1] = C_White;
//                              C_Purpel_Color[2] = C_Purple;
//                              C_Purpel_Color[3] = C_White;
//                            });
//                          },
//                        ),
//                        GestureDetector(
//                          child: Answers(
//                              4,
//                              C_Purpel_Color[3],
//                              Units.questionsArray[widget.QestionsNumber][4],
//                              widget.BorderColor[3]),
//                          onTap: () {
//                            setState(() {
//                              widget.SelectedAnswer = 4;
//                              C_Purpel_Color[0] = C_White;
//                              C_Purpel_Color[1] = C_White;
//                              C_Purpel_Color[2] = C_White;
//                              C_Purpel_Color[3] = C_Purple;
//                            });
//                          },
//                        ),
//                        Button("اختيار", () {
//                          setState(() {
//                            widget.correctAns = Units.questionsArray[widget.QestionsNumber][5];
//                            if (widget.SelectedAnswer != 0) {
//                              // Change the Correct Color
//                              widget.BorderColor[widget.SelectedAnswer - 1] =
//                              Colors.red[500]; // Make selected Answer Red
//                              widget.BorderColor[widget.correctAns - 1] =
//                                  Colors.green; // Change the right Answer to purble
//                              // Wait
//                              Future.delayed(const Duration(milliseconds: 800),
//                                      () async{
//                                    // Calculate Score
//                                    if (widget.correctAns == widget.SelectedAnswer) {
//                                      widget.Score++;
//                                    }
//                                    // Reset Boarder Colors
//                                    setState(() {
//                                      // Reset Border Color
//                                      widget.BorderColor = [
//                                        Colors.grey[400],
//                                        Colors.grey[400],
//                                        Colors.grey[400],
//                                        Colors.grey[400]
//                                      ];
//                                      // Reset Circle Coise Color
//                                      C_Purpel_Color[0] = C_White;
//                                      C_Purpel_Color[1] = C_White;
//                                      C_Purpel_Color[2] = C_White;
//                                      C_Purpel_Color[3] = C_White;
//                                    });
//
//                                    // Reset widget.SelectedAnswer
//                                    widget.SelectedAnswer = 0;
//                                    // Go To the Next Questions
//                                    if (widget.QestionsNumber <
//                                        (Units.questionNumber -
//                                            1)) {
//                                      widget.QestionsNumber++;
//                                    } else {
//                                      var Score =(widget.Score/Units.questionNumber)*100;
//                                      FlutterFlexibleToast.showToast(
//                                          message: "Your Score is ${Score.toInt()}",
//                                          toastLength: Toast.LENGTH_LONG,
//                                          toastGravity: ToastGravity.BOTTOM,
//                                          icon: Score >40 ?ICON.SUCCESS:ICON.INFO,
//                                          radius: 0,
//                                          elevation: 10,
//                                          imageSize: (3*SizeConfig.textMultiplier).toInt(),
//                                          textColor: Colors.white,
//                                          backgroundColor: Score >40 ?Colors.green:Colors.red[500],
//                                          timeInSeconds: 3
//                                      );
//
//                                      localStorage.saveData(Units_Name[Units.Unit_id],Score.toInt());
//                                      Units.UnitScore[Units.Unit_id]=Score.toInt();
//                                      widget.Score=0;
//                                      widget.QestionsNumber=0;
//                                      Units.Unit_id=0;
//                                      MultibleChoiseAds.show(); //not sowing
//                                      Navigator.pop(context);
//                                    }
//                                  });
//                            }
//                          });
//                        }),
//                        SizedBox(height: SizeConfig.heightMultiplier*5,),
//                      ],
//                    ),

//***///
//      widget.correctAns = Units.questionsArray[widget.QestionsNumber][5];
//      if (widget.SelectedAnswer != 0) {
//        // Change the Correct Color
//        widget.BorderColor[widget.SelectedAnswer - 1] =
//            Colors.red[500]; // Make selected Answer Red
//        widget.BorderColor[widget.correctAns - 1] =
//            Colors.green; // Change the right Answer to purble
//        // Wait
//        if (widget.correctAns == widget.SelectedAnswer) {
//          widget.Score++;
//        }
//        // Reset Boarder Colors
//        setState(() {
//          // Reset Border Color
//          widget.BorderColor = [
//            Colors.grey[400],
//            Colors.grey[400],
//            Colors.grey[400],
//            Colors.grey[400]
//          ];
//          // Reset Circle Coise Color
//          C_Purpel_Color[0] = C_White;
//          C_Purpel_Color[1] = C_White;
//          C_Purpel_Color[2] = C_White;
//          C_Purpel_Color[3] = C_White;
//        });

// Reset widget.SelectedAnswer
//widget.SelectedAnswer = 0;
//        Future.delayed(const Duration(milliseconds: 800),
//                () async {
//              // Calculate Score
//              if (widget.correctAns == widget.SelectedAnswer) {
//                widget.Score++;
//              }
//              // Reset Boarder Colors
//              setState(() {
//                // Reset Border Color
//                widget.BorderColor = [
//                  Colors.grey[400],
//                  Colors.grey[400],
//                  Colors.grey[400],
//                  Colors.grey[400]
//                ];
//                // Reset Circle Coise Color
//                C_Purpel_Color[0] = C_White;
//                C_Purpel_Color[1] = C_White;
//                C_Purpel_Color[2] = C_White;
//                C_Purpel_Color[3] = C_White;
//              });
//
//              // Reset widget.SelectedAnswer
//              widget.SelectedAnswer = 0;
////              // Go To the Next Questions
////              if (widget.QestionsNumber <
////                  (Units.questionNumber -
////                      1)) {
////                widget.QestionsNumber++;
////              } else {
////                var Score = (widget.Score / Units.questionNumber) * 100;
////                FlutterFlexibleToast.showToast(
////                    message: "Your Score is ${Score.toInt()}",
////                    toastLength: Toast.LENGTH_LONG,
////                    toastGravity: ToastGravity.BOTTOM,
////                    icon: Score > 40 ? ICON.SUCCESS : ICON.INFO,
////                    radius: 0,
////                    elevation: 10,
////                    imageSize: (3 * SizeConfig.textMultiplier).toInt(),
////                    textColor: Colors.white,
////                    backgroundColor: Score > 40 ? Colors.green : Colors
////                        .red[500],
////                    timeInSeconds: 3
////                );
////
////                localStorage.saveData(Units_Name[Units.Unit_id], Score.toInt());
////                Units.UnitScore[Units.Unit_id] = Score.toInt();
////                widget.Score = 0;
////                widget.QestionsNumber = 0;
////                Units.Unit_id = 0;
////                MultibleChoiseAds.show(); //not sowing
////                Navigator.pop(context);
//              }
//            });
//      }
// Next Question
//                          Button("اختيار", () {
//                            setState(() {
//                              widget.correctAns = Units.questionsArray[widget.QestionsNumber][5];
//                              if (widget.SelectedAnswer != 0) {
//                                // Change the Correct Color
//                                widget.BorderColor[widget.SelectedAnswer - 1] =
//                                Colors.red[500]; // Make selected Answer Red
//                                widget.BorderColor[widget.correctAns - 1] =
//                                    Colors.green; // Change the right Answer to purble
//                                // Wait
//                                Future.delayed(const Duration(milliseconds: 800),
//                                        () async{
//                                      // Calculate Score
//                                      if (widget.correctAns == widget.SelectedAnswer) {
//                                        widget.Score++;
//                                      }
//                                      // Reset Boarder Colors
//                                      setState(() {
//                                        // Reset Border Color
//                                        widget.BorderColor = [
//                                          Colors.grey[400],
//                                          Colors.grey[400],
//                                          Colors.grey[400],
//                                          Colors.grey[400]
//                                        ];
//                                        // Reset Circle Coise Color
//                                        C_Purpel_Color[0] = C_White;
//                                        C_Purpel_Color[1] = C_White;
//                                        C_Purpel_Color[2] = C_White;
//                                        C_Purpel_Color[3] = C_White;
//                                      });
//
//                                      // Reset widget.SelectedAnswer
//                                      widget.SelectedAnswer = 0;
//                                      // Go To the Next Questions
//                                      if (widget.QestionsNumber <
//                                          (Units.questionNumber -
//                                              1)) {
//                                        widget.QestionsNumber++;
//                                      } else {
//                                        var Score =(widget.Score/Units.questionNumber)*100;
//                                        FlutterFlexibleToast.showToast(
//                                            message: "Your Score is ${Score.toInt()}",
//                                            toastLength: Toast.LENGTH_LONG,
//                                            toastGravity: ToastGravity.BOTTOM,
//                                            icon: Score >40 ?ICON.SUCCESS:ICON.INFO,
//                                            radius: 0,
//                                            elevation: 10,
//                                            imageSize: (3*SizeConfig.textMultiplier).toInt(),
//                                            textColor: Colors.white,
//                                            backgroundColor: Score >40 ?Colors.green:Colors.red[500],
//                                            timeInSeconds: 3
//                                        );
//
//                                        localStorage.saveData(Units_Name[Units.Unit_id],Score.toInt());
//                                        Units.UnitScore[Units.Unit_id]=Score.toInt();
//                                        widget.Score=0;
//                                        widget.QestionsNumber=0;
//                                        Units.Unit_id=0;
//                                        MultibleChoiseAds.show(); //not sowing
//                                        Navigator.pop(context);
//                                      }
//                                    });
//                              }
//                            });
//                          }),
