import 'package:auto_size_text/auto_size_text.dart';
import '../model/apptheme.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter/material.dart';
import '../model/sizeConfig.dart';
import '../model/constant.dart';
import '../controller/unitScreenController.dart';

class UnitScreen extends StatefulWidget {
  static final id="UnitScreen";
  @override
  _UnitScreenState createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          body: Container(
              color: Constant.C_Gray,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 3* SizeConfig.heightMultiplier,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        2 * SizeConfig.widthMultiplier,
                        5 * SizeConfig.heightMultiplier,
                        2 * SizeConfig.widthMultiplier,
                        2 * SizeConfig.heightMultiplier),
                    child: FlutterToggleTab(
                      borderRadius: 20,
                      height: 7 * SizeConfig.heightMultiplier,
                      width: 20 * SizeConfig.widthMultiplier,
                      initialIndex: 0,
                      selectedBackgroundColors: [Constant.PrimaryColor],
                      selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 2.3 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w700),
                      unSelectedTextStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w500),
                      labels: [Constant.ourMl5s, Constant.otherRelatedFile],
                      selectedLabelIndex: (index) {
                        setState(() {
                          index == 0
                              ? UnitScreenController.showUnits = true
                              : UnitScreenController.showUnits = false;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 65*SizeConfig.heightMultiplier,
                      child: UnitScreenController.returnUnitContentPageList(parent: this),
                  ),
//                  Flexible(
//                    child: Stack(
//                      children: <Widget>[
//                        ListView.builder(
//                            itemCount: 1,//Units.unitNumber,
//                            itemBuilder: (BuildContext ctxt, int index) {
//                              return Column(
//                                children: <Widget>[
//                                  index == 0
//                                      ? SizedBox(
//                                    height:
//                                    1* SizeConfig.heightMultiplier,
//                                  )
//                                      : SizedBox(
//                                    height:
//                                    0.4 * SizeConfig.heightMultiplier,
//                                  ),
//                                ],
//                              );
//                            }),
//                      ],
//                    ),
//                  ),
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
                            ),
                          )

                      ),
                      SizedBox(
                        width: 10* SizeConfig.widthMultiplier,
                      ),
                      Image.asset("images/women.png",width: SizeConfig.textMultiplier*25,),
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
