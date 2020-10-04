// packages
import 'package:auto_size_text/auto_size_text.dart';
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
//  static var UnitScore = new List(100);
  FToast fToast;
  @override
  _UnitsState createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
  @override
  void initState() {
    setState(() {
      Units.state = false;
    });
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
                    Flexible(
                      child: Stack(

                        children: <Widget>[
                          Padding(
                            padding:EdgeInsets.fromLTRB(0, 0, 7* SizeConfig.widthMultiplier, 0),
                            child: Text(
                              "جميع الوحد ",
                              style: AppTheme.MaterialName.copyWith(color: PrimaryColor),
                            ),
                          ),
                          ListView.builder(
                              itemCount: Units.unitNumber,
                              itemBuilder: (BuildContext ctxt, int index) {
                                print(Units.unitScore[index]);
                                return Column(
                                  children: <Widget>[
                                    index == 0
                                        ? SizedBox(
                                            height:
                                                2.5* SizeConfig.heightMultiplier,
                                          )
                                        : SizedBox(
                                            height:
                                                0.4 * SizeConfig.heightMultiplier,
                                          ),
                                    buildGestureDetector(Units.UnitName[index], "${UnitsArray[index].length} سؤال ", Units.unitScore[index], index, Units.materialName),
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
            bottomNavigationBar: MyBottomAppBar(),
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(var BoxTitel, var NumerOfQwstions,
      var final_Score, var unit_id,var materialName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Units.Unit_id = unit_id;
          Units.state = true;
        });
      },

      child: UnitBoxs(
        BoxTitel,
        final_Score,
        NumerOfQwstions,
        materialName,
      ),
    );
  }
}


// TODO :
/*
*  - Change the Bottom NavBar Done
*  - Change Unit Box Style and Function
*  - Make the Design Like AdobeXD
*  - Create Share Option
* */