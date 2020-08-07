// Packages
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

// ADS
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import '../function/ads.dart';



// Component
import '../component/Answers.dart';
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
import '../function/localStorage.dart';
import '../function/search.dart';


class MultibleChoise extends StatefulWidget {
//  ADMOB
  static final id = "MultibleChoise";
  static var isSearching = false;
  static var Search = false;
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
  _MultibleChoiseState createState() => _MultibleChoiseState();
}

class _MultibleChoiseState extends State<MultibleChoise> {
  final ahmdaAds = ADS();
  InterstitialAd MultibleChoiseAds;
  BannerAd MultibleChoiseBannerAds;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-9661386178168248~7055214624' );
    MultibleChoiseAds = ahmdaAds.getNewInterstital();
    MultibleChoiseBannerAds =ahmdaAds.getNewBannerAd();
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
        body: WillPopScope(
          // ignore: missing_return
          onWillPop:(){
            setState(() {
              if(!MultibleChoise.Search){
                Navigator.pop(context);
              }else{
                MultibleChoise.Search=false;
              }
            });
          },
          child: Container(
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
                        setState(() {MultibleChoise.isSearching = !MultibleChoise.isSearching;});
                      },
                      child: Icon(
                        !MultibleChoise.isSearching ? Icons.search : Icons.cancel,
                        color: Colors.white,
                        size: !MultibleChoise.isSearching ? 7*SizeConfig.textMultiplier : 4*SizeConfig.textMultiplier,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: MultibleChoise.isSearching
                        ? TextField(
                      autofocus: true,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      onSubmitted: (String search){
                        Search.Result.clear();
                        if(search.isNotEmpty){
                          Search.search(search);
                          setState(() {
                            MultibleChoise.Search =true;
                          });
                        }


                      },
                      decoration: InputDecoration(
                        hintText: "يبحث",
                        hintStyle: TextStyle(
                          fontSize: 2.2*SizeConfig.textMultiplier,
                          color: Colors.white,
                        ),

                      ),
                    )
                        : Text(""),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(0, 1.2*SizeConfig.heightMultiplier, 0, 0),
                      child: Text(
                        !MultibleChoise.isSearching ? AppName : "",
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
                      padding:  EdgeInsets.fromLTRB(1.6 *SizeConfig.widthMultiplier, 1.7*SizeConfig.heightMultiplier, 1.6*SizeConfig.widthMultiplier,  1.7*SizeConfig.heightMultiplier),
                      child: Container(
                        height: SizeConfig.heightMultiplier * 87,
                        decoration: AppTheme.UnitBoxes,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              width: 40 * SizeConfig.widthMultiplier,
                              height: 35 * SizeConfig.widthMultiplier,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(4*SizeConfig.widthMultiplier, 6*SizeConfig.widthMultiplier, 4*SizeConfig.widthMultiplier, 4*SizeConfig.widthMultiplier),
                                child: Center(
                                  child: Text(
                                    UnitsArray[Units.Unit_id][widget.QestionsNumber][1],
                                    style: AppTheme.Question,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.fromLTRB(4*SizeConfig.widthMultiplier, 0, 4*SizeConfig.widthMultiplier, 0),
                              child: StepProgressIndicator(
                                totalSteps: UnitsArray[Units.Unit_id].length ,
                                currentStep: widget.QestionsNumber,
                                size: 8,
                                padding: 0,
                                selectedColor: C_Purple,
                                unselectedColor: Colors.grey[200],
                                roundedEdges: Radius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 4*SizeConfig.heightMultiplier,
                            ),
                            GestureDetector(
                              child: Answers(
                                  1,
                                  C_Purpel_Color[0],
                                  UnitsArray[Units.Unit_id][widget.QestionsNumber][2],
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
                                  UnitsArray[Units.Unit_id][widget.QestionsNumber][3],
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
                                  UnitsArray[Units.Unit_id][widget.QestionsNumber][4],
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
                                  UnitsArray[Units.Unit_id][widget.QestionsNumber][5],
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
                            Button("اختيار", () {
                              setState(() {
                                widget.correctAns = UnitsArray[Units.Unit_id]
                                [widget.QestionsNumber][6];
                                if (widget.SelectedAnswer != 0) {
                                  // Change the Correct Color
                                  widget.BorderColor[widget.SelectedAnswer - 1] =
                                  Colors.red[500]; // Make selected Answer Red
                                  widget.BorderColor[widget.correctAns - 1] =
                                      Colors.green; // Change the right Answer to purble
                                  // Wait
                                  Future.delayed(const Duration(milliseconds: 800),
                                          () async{
                                        // Calculate Score
                                        if (widget.correctAns == widget.SelectedAnswer) {
                                          widget.Score++;
                                        }
                                        // Reset Boarder Colors
                                        setState(() {
                                          // Reset Border Color
                                          widget.BorderColor = [
                                            Colors.grey[400],
                                            Colors.grey[400],
                                            Colors.grey[400],
                                            Colors.grey[400]
                                          ];
                                          // Reset Circle Coise Color
                                          C_Purpel_Color[0] = C_White;
                                          C_Purpel_Color[1] = C_White;
                                          C_Purpel_Color[2] = C_White;
                                          C_Purpel_Color[3] = C_White;
                                        });

                                        // Reset widget.SelectedAnswer
                                        widget.SelectedAnswer = 0;
                                        // Go To the Next Questions
                                        if (widget.QestionsNumber <
                                            (UnitsArray[Units.Unit_id].length - 1)) {
                                          widget.QestionsNumber++;
                                        } else {
                                          var Score =(widget.Score/(UnitsArray[Units.Unit_id].length))*100;
                                          FlutterFlexibleToast.showToast(
                                              message: "Your Score is ${Score.toInt()}",
                                              toastLength: Toast.LENGTH_LONG,
                                              toastGravity: ToastGravity.BOTTOM,
                                              icon: Score >40 ?ICON.SUCCESS:ICON.INFO,
                                              radius: 0,
                                              elevation: 10,
                                              imageSize: (3*SizeConfig.textMultiplier).toInt(),
                                              textColor: Colors.white,
                                              backgroundColor: Score >40 ?Colors.green:Colors.red[500],
                                              timeInSeconds: 3
                                          );

                                          localStorage.saveData(Units_Name[Units.Unit_id],Score.toInt());
                                          widget.Score=0;
                                          widget.QestionsNumber=0;
                                          Units.Unit_id=0;
                                          MultibleChoiseAds.show(); //not sowing
                                          Navigator.pop(context);
                                        }
                                      });
                                }
                              });
                            }),
                            SizedBox(height: SizeConfig.heightMultiplier*5,),
                          ],
                        ),
                      ),
                    ),
                    SearchResult(MultibleChoise.Search)
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
