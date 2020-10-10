// Packages
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ADS
import 'package:firebase_admob/firebase_admob.dart';
import '../function/ads.dart';
// Component
import '../component/Answers.dart';
import '../component/Button.dart';
import '../component/multibleChoiseQuestionPart.dart';
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
                      child: Answers(
                          1,
                          C_Purpel_Color[0],
                          Units.questionsArray[widget.QestionsNumber][1],
                          widget.BorderColor[0]),
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
                      child: Answers(
                          2,
                          C_Purpel_Color[1],
                          Units.questionsArray[widget.QestionsNumber][2],
                          widget.BorderColor[1]),
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
                      child: Answers(
                          3,
                          C_Purpel_Color[2],
                          Units.questionsArray[widget.QestionsNumber][3],
                          widget.BorderColor[2]),
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
                      child: Answers(
                          4,
                          C_Purpel_Color[3],
                          Units.questionsArray[widget.QestionsNumber][4],
                          widget.BorderColor[3]),
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
        widget.Score = 0;
        widget.QestionsNumber = 0;
        Units.Unit_id = 0;
        MultibleChoiseAds.show();
        Navigator.pop(context);
        // Show Score in Dialog
        return CustomBgAlertBox(
            context: context,
            title: "نتيجتك",
            bgColor: C_Gray,
            buttonColor: PrimaryColor,
            titleTextColor: PrimaryColor,
            infoMessage: "Your Score is ${score.toInt()}",
            buttonText: "تمام ",

        );
        Fluttertoast.showToast(
            msg: "Your Score is ${score.toInt()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: score > 40 ? Colors.green : Colors.red[500],
            textColor: Colors.white,
            fontSize: 16.0
        );

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
