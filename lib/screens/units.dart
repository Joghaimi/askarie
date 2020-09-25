// packages
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
  static var questionsArray = new List(100);
  static var questionNumber=0;
  // Searching
  static var isSearching = false;
  // For Unit And Type
  static var Unit_id;
  static var Search = false;
  static var UnitScore = new List(100);
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
                          child: Text(
                            Units.materialName,
                            style: AppTheme.AllMaterialName,
                          ),
                        ),
                        SizedBox(
                          width: 18* SizeConfig.widthMultiplier,
                        ),
                        Image.asset("images/women.png",),
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
                                    buildGestureDetector(
                                        Units.UnitName[index],
                                        "${UnitsArray[index].length} سؤال ",
                                        "${Units.UnitScore[index]}/100",
                                        index,
                                        Units.UnitScore[index] == 0
                                            ? Colors.white
                                            : C_Purple,
                                        Units.materialName),

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
      var final_Score, var unit_id, var circleColors ,var materialName) {

    return GestureDetector(
      onTap: () {
        setState(() {
          Units.Unit_id = unit_id;
          Units.state = true;
        });
      },
      child: UnitBoxs(
        BoxTitel,
        NumerOfQwstions,
        final_Score,
        circleColors,
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