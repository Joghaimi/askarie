// packages
import 'package:askarie/function/ads.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Component
import '../component/UnitBoxs.dart';
import '../component/SearchResult.dart';
import '../component/MyBottomAppBar.dart';
// Constant
import '../constent/Color.dart';
import '../material/Units.dart';
// themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';
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
  static var testLoadRewordAdState =false;
  static var testCoin =0;
  static RewardedVideoAd videoAd =RewardedVideoAd.instance;
  FToast fToast;
  @override
  _UnitsState createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
  @override
  void initState() {
    setState(() {Units.state = false;});
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
          ),
        ),
      ),
    );
  }
}





