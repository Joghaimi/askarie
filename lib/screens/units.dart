// packages
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Component
import '../component/MyAppBar.dart';
import '../component/UnitBoxs.dart';
import '../component/ChoseOption.dart';
import '../component/SearchResult.dart';
import '../component/MyBottomAppBar.dart';
// Constant
import '../constent/Color.dart';
import '../material/Units.dart';
import '../constent/Text.dart';
// themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';
// Function
import '../function/search.dart';
// Screens
import 'AllMaterial.dart';

class Units extends StatefulWidget {
  // Unit Root
  static final id = "units";
  static final ad = 0;
  static var state = false;
  static bool loadingState = false;
  // Unit From Material
  static var materialName ;
  static var unitNumber = 0;
  static var UnitName = [];
  static var unitScore =[];
  static var questionsArray = new List(100);
  static var questionNumber=0;
  // Searching
  static var isSearching = false;
  // For Unit And Type
  static var Unit_id;
  static var Search = false;
  // For Unit SelectedTest
  static var selectedUnits=[];
  static var testButtonColor = C_White;
  static var testBtn =false;
  FToast fToast;
  @override
  _UnitsState createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
  bool _loaded = false;
  @override
  void initState() {
    setState(() {
      Units.state = false;
    });
//    // Rewords Video
    RewardedVideoAd.instance.load(adUnitId:  "ca-app-pub-3940256099942544/5224354917" );
//
//    RewardedVideoAd.instance.load(adUnitId: "ca-app-pub-3940256099942544/5224354917").catchError((e) => print("error in loading 1st time"))
//        .then((v) => setState(() => _loaded = v));
//    // ad listener
//    RewardedVideoAd.instance.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
//      if (event == RewardedVideoAdEvent.closed) {
//        RewardedVideoAd.instance
//            .load(adUnitId: RewardedVideoAd.testAdUnitId,)
//            .catchError((e) => print("error in loading again"))
//            .then((v) => setState(() => _loaded = v));
//      }
//    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        // ToDo make it Able to go bake
        // ignore: missing_return
        onWillPop: () {
          Navigator.pushNamed(context, AllMaterial.id);
        },
        child: Container(
          child: Scaffold(
            body: LoadingOverlay(
              child: Container(
                color: C_Gray,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10* SizeConfig.heightMultiplier,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5 * SizeConfig.heightMultiplier, 0, 0),
                          child:
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 40* SizeConfig.widthMultiplier,
                              child: AutoSizeText(
                                Units.materialName,
                                style: AppTheme.AllMaterialName,
                              ),
                            ),
                          )

                        ),
                        SizedBox(
                          width: 10* SizeConfig.widthMultiplier,
                        ),
                        Image.asset("images/women.png",width: SizeConfig.textMultiplier*25,),
                      ],

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 0, 7* SizeConfig.widthMultiplier, 0),
                          child: Text(
                            "جميع الوحد ",
                            style: AppTheme.MaterialName.copyWith(color: PrimaryColor),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Stack(

                        children: <Widget>[
                          ListView.builder(
                              itemCount: Units.unitNumber,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return Column(
                                  children: <Widget>[
                                    index == 0
                                        ? SizedBox(
                                            height:
                                                1* SizeConfig.heightMultiplier,
                                          )
                                        : SizedBox(
                                            height:
                                                0.4 * SizeConfig.heightMultiplier,
                                          ),
                                    UnitBoxs(Units.UnitName[index],Units.unitScore[index],"${UnitsArray[index].length} سؤال ",Units.materialName,index),

                                  ],
                                );
                              }),
                          SearchResult(Units.Search),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                isLoading:Units.loadingState,
            ),
            bottomNavigationBar: MyBottomAppBar(Units.testButtonColor),
            floatingActionButton: FloatingActionButton(
              // show ad on FAB click
              onPressed: () async {
                RewardedVideoAd.instance.show();

//                await RewardedVideoAd.instance.show().catchError((e) => print("error in showing ad: ${e.toString()}"));
////                setState(() => _loaded = false);
              },
            ),

          ),
        ),
      ),
    );
  }
}
