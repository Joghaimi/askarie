import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../model/sizeConfig.dart';
import '../model/apptheme.dart';
import '../model/constant.dart';
class UnitScreen extends StatefulWidget {
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
                          style: AppTheme.MaterialName.copyWith(color: Constant.PrimaryColor),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
//          bottomNavigationBar: MyBottomAppBar(Units.testButtonColor),
        ),
      ),
    );
  }
}
