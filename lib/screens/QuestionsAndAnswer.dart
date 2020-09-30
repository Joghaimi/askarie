// Packages
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:auto_direction/auto_direction.dart';

// ADS
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import '../function/ads.dart';

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
  final ahmdaAds = ADS();
  InterstitialAd MultibleChoiseAds;
  BannerAd MultibleChoiseBannerAds;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-9661386178168248~7055214624');
    MultibleChoiseAds = ahmdaAds.getNewInterstital();
    MultibleChoiseBannerAds = ahmdaAds.getNewBannerAd();
    MultibleChoiseAds.load();
    MultibleChoiseBannerAds.load();
    super.initState();
  }

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
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.widthMultiplier * 3,
                SizeConfig.heightMultiplier * 1,
                SizeConfig.widthMultiplier * 3,
                0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(""),
                    height: SizeConfig.heightMultiplier * 14,
                  ),
                  Container(
                    height: SizeConfig.heightMultiplier * 65,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: C_Purple,
                          width: 4 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      color: C_White,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        SizeConfig.widthMultiplier * 3,
                        SizeConfig.heightMultiplier * 10,
                        SizeConfig.widthMultiplier * 3,
                        SizeConfig.heightMultiplier * 1,
                      ),
                      child: Column(
                        children: <Widget>[
                          StepProgressIndicator(
                            totalSteps: Units.questionNumber,
                            currentStep: widget.QestionsNumber,
                            size: 6,
                            padding: 0,
                            selectedColor: C_Purple,
                            unselectedColor: C_White,
                            progressDirection: TextDirection.rtl,
                            roundedEdges: Radius.circular(20),
                          ),
                          Container(
                            height: SizeConfig.heightMultiplier * 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                    height: SizeConfig.heightMultiplier * 2),
                                Container(
                                  height: SizeConfig.heightMultiplier * 10,
                                  child: AutoDirection(
                                    text: Units.questionsArray[
                                        widget.QestionsNumber][0],
                                    child: AutoSizeText(
                                      Units.questionsArray[
                                          widget.QestionsNumber][0],
                                      style: AppTheme.SmallSizeText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: SizeConfig.heightMultiplier * 20,
                            child: Units.questionsArray[widget.QestionsNumber]
                                        [5] <
                                    5
                                ? AutoDirection(
                                    text: Units.questionsArray[
                                            widget.QestionsNumber][
                                        Units.questionsArray[
                                            widget.QestionsNumber][5]],
                                    child: AutoSizeText(
                                      Units.questionsArray[
                                              widget.QestionsNumber][
                                          Units.questionsArray[
                                              widget.QestionsNumber][5]],
                                      style: AppTheme.SmallSizeText,
                                    ),
                                  )
                                : AutoDirection(
                                    text: Units.questionsArray[
                                        widget.QestionsNumber][1],
                                    child: AutoSizeText(
                                      "${Units.questionsArray[widget.QestionsNumber][1]}\n ${Units.questionsArray[widget.QestionsNumber][2]} \n ${Units.questionsArray[widget.QestionsNumber][3]}  ",
                                      style: AppTheme.SmallSizeText,
                                    ),
                                  ),
                          ),
                          Expanded(
                            child: Text(""),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    child: FaIcon(
                                      FontAwesomeIcons.arrowCircleRight,
                                      color: C_Purple,
                                      size: SizeConfig.textMultiplier * 5,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        nextQs();
                                      });
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.arrowCircleLeft,
                                    color: C_Purple,
                                    size: SizeConfig.textMultiplier * 5,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      backQs();
                                    });
                                  },
                                ),
                              ],
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
      ),
    );
  }

  nextQs() {
    if (widget.QestionsNumber < (Units.questionNumber - 1)) {
      // Don't Show All of above or non
      if (Units.questionsArray[widget.QestionsNumber + 1][5] <= 5) {
        widget.QestionsNumber++;
      } else {
        var i = 1;
        while (Units.questionsArray[widget.QestionsNumber + i][5] >= 5) {
          i++;
        }
        widget.QestionsNumber += i;
      }
    } else {
      MultibleChoiseBannerAds.dispose();
      MultibleChoiseAds.show();
      widget.QestionsNumber = 0;
      Navigator.pop(context);
    }
  }

  backQs() {
    if (widget.QestionsNumber > 0) {
      widget.QestionsNumber--;
    }
  }
}

// TODO
/*
* * Add the Bottom NaveBar
* * Make The Shown Image Right !!
* */

// ** TOP NAvBar
//  Container(
//                  height: 8 * SizeConfig.heightMultiplier,
//                  color: C_Purple,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Expanded(
//                        flex: 1,
//                        child: GestureDetector(
//                          onTap: () {
//                            setState(() {
//                              QuestionsAndAnswer.isSearching =
//                                  !QuestionsAndAnswer.isSearching;
//                            });
//                          },
//                          child: Icon(
//                            !QuestionsAndAnswer.isSearching
//                                ? Icons.search
//                                : Icons.cancel,
//                            color: Colors.white,
//                            size: !QuestionsAndAnswer.isSearching
//                                ? 7 * SizeConfig.textMultiplier
//                                : 4 * SizeConfig.textMultiplier,
//                          ),
//                        ),
//                      ),
//                      Expanded(
//                        flex: 3,
//                        child: QuestionsAndAnswer.isSearching
//                            ? TextField(
//                                autofocus: true,
//                                textDirection: TextDirection.rtl,
//                                textAlign: TextAlign.center,
//                                style: TextStyle(color: Colors.white),
//                                onSubmitted: (String search) {
//                                  Search.Result.clear();
//                                  if (search.isNotEmpty) {
//                                    Search.search(search);
//                                    setState(() {
//                                      QuestionsAndAnswer.Search = true;
//                                    });
//                                  }
//                                },
//                                decoration: InputDecoration(
//                                  hintText: "بحث",
//                                  hintStyle: TextStyle(
//                                    fontSize: 2.2 * SizeConfig.textMultiplier,
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              )
//                            : Text(""),
//                      ),
//                      Expanded(
//                        flex: 1,
//                        child: Padding(
//                          padding: EdgeInsets.fromLTRB(
//                              0, 1.2 * SizeConfig.heightMultiplier, 0, 0),
//                          child: Text(
//                            !QuestionsAndAnswer.isSearching ? AppName : "",
//                            style: AppTheme.Titel.copyWith(
//                              fontSize: 3.5 * SizeConfig.textMultiplier,
//                              height: 0.15 * SizeConfig.heightMultiplier,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),

/**/
//              Stack(
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.fromLTRB(
//                          1.6 * SizeConfig.widthMultiplier,
//                          1.7 * SizeConfig.heightMultiplier,
//                          1.6 * SizeConfig.widthMultiplier,
//                          1.7 * SizeConfig.heightMultiplier),
//                      child: Container(
//                        height: SizeConfig.heightMultiplier * 87,
//                        decoration: AppTheme.UnitBoxes,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.stretch,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(
//                                  4 * SizeConfig.widthMultiplier,
//                                  12 * SizeConfig.widthMultiplier,
//                                  4 * SizeConfig.widthMultiplier,
//                                  8 * SizeConfig.widthMultiplier),
//                              child: Container(
//                                width: 40 * SizeConfig.widthMultiplier,
//                                height: 35 * SizeConfig.widthMultiplier,
//                                child: Center(
//                                  child: Text(
//                                    Units.questionsArray[widget.QestionsNumber][0],
////                                    UnitsArray[1]
////                                        [widget.QestionsNumber][1],
//                                    style: AppTheme.Question,
//                                    textDirection: TextDirection.rtl,
//                                    textAlign: TextAlign.center,
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(
//                                  4 * SizeConfig.widthMultiplier,
//                                  0,
//                                  4 * SizeConfig.widthMultiplier,
//                                  0),
//                              child: StepProgressIndicator(
//                                totalSteps:
//                                    UnitsArray[Units.Unit_id].length - 1,
//                                currentStep: widget.QestionsNumber,
//                                size: 8,
//                                padding: 0,
//                                selectedColor: C_Purple,
//                                unselectedColor: Colors.grey[200],
//                                roundedEdges: Radius.circular(10),
//                              ),
//                            ),
//                            SizedBox(
//                              height: 7 * SizeConfig.heightMultiplier,
//                            ),
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(
//                                  4 * SizeConfig.heightMultiplier,
//                                  8 * SizeConfig.heightMultiplier,
//                                  4 * SizeConfig.heightMultiplier,
//                                  4 * SizeConfig.heightMultiplier),
//                              child: Text(
////                                Units.questionsArray[widget.QestionsNumber][5].toString(),
//                                Units.questionsArray[widget.QestionsNumber][Units.questionsArray[widget.QestionsNumber][5]-1],
//                                style: AppTheme.QestionsAndAnswersText,
//                                textDirection: TextDirection.rtl,
//                              ),
//                            ),
//                            Expanded(
//                              child: Text(""),
//                            ),
//                            Button("التالي", () {
//                              setState(() {
//                                if (widget.QestionsNumber <
//                                    (UnitsArray[Units.Unit_id].length - 1)) {
//                                  widget.QestionsNumber++;
//                                } else {
//                                  Units.Unit_id = 0;
//                                  MultibleChoiseAds.show(); //not sowing
//                                  Navigator.pop(context);
//                                }
//                              });
//                            }),
//
//                            SizedBox(
//                              height: SizeConfig.heightMultiplier * 5,
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                    SearchResult(QuestionsAndAnswer.Search),
//                  ],
