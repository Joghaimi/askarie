import 'package:auto_size_text/auto_size_text.dart';
import '../model/apptheme.dart';
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
                  UnitScreenController.returnTabBar(this),
                  UnitScreenController.returnUnitContentPageList(parent: this),
                  UnitScreenController.returnUnUsefulImage(),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
