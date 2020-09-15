// packages
import 'package:flutter/material.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

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

class Units extends StatefulWidget {
  static final id = "units";
  static final ad = 0;
  static var state = false;

  // Unit From Material
  static var unitNumber = 0;
  static var UnitName = new List(100);
  // Searching
  static var isSearching = false;

  // For Unit And Type
  static var Unit_id;
  static var Search = false;
  static var UnitScore = new List(100);

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
        onWillPop: () {
          setState(() {
            Units.state = false;
            Units.Search = false;
          });
        },
        child: Container(
          child: Scaffold(
            body: Container(
              color: C_Gray,
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 20 * SizeConfig.widthMultiplier,
                        ),
                        ListView.builder(
                            itemCount: Units.unitNumber,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Column(
                                children: <Widget>[
                                  index == 0
                                      ? SizedBox(
                                          height:
                                              8 * SizeConfig.heightMultiplier,
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
                                          : C_Purple),
                                ],
                              );
                            }),
                        ChoseOption(Units.state),
                        SearchResult(Units.Search),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: MyBottomAppBar(),
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(var BoxTitel, var NumerOfQwstions,
      var final_Score, var unit_id, var circleColors) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Units.Unit_id = unit_id;
          Units.state = true;
        });
      },
      child: UnitBoxs(
        BoxTitel: BoxTitel,
        NumerOfQestions: NumerOfQwstions,
        Final_Score: final_Score,
        circleColors: circleColors,
      ),
    );
  }
}


// TODO :
/*
*  - Change the Bottom NavBar
*  - Change Unit Box Style and Function
*  - Make the Design Like AdobeXD
*  - Create Share Option
* */