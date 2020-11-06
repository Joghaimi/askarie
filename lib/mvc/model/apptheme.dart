import 'package:flutter/material.dart';
import '../model/constant.dart';
import 'sizeConfig.dart';
class AppTheme{
  static final TextStyle UnitName = TextStyle(
    color: Constant.C_TextGray,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.7 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle Question = TextStyle(
    color: Colors.black,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.7 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle Button = TextStyle(
    color: Colors.white,
    fontFamily: 'ArbFONTS-Asmaa',
    decorationThickness: 1.0,
    fontSize: 3.0 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle ButtonNext = TextStyle(
    color: Constant.C_Purple,
    fontFamily: 'ArbFONTS-Asmaa',
    decorationThickness: 1.0,
    fontSize: 3.0 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle QestionAns  = TextStyle(
    color: Constant.C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle SelectType  = TextStyle(
    color: Constant.C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 3 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle UnitScore = TextStyle(
    color: Constant.C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.3 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle QestionsAndAnswersText = TextStyle(
    color: Constant.C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 3.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle Titel = TextStyle(
    color: Colors.white,
    fontFamily: 'samat',
    fontSize: 60,
  );
  static final BoxDecoration  buttonSubmit = BoxDecoration(
    border: Border.all(
      width:1,
      color: Constant.C_Purple,
    ),
    color: Colors.white,
  );
  static final BoxDecoration  Answers = BoxDecoration(
    border: Border.all(
      width:1,
      color: Colors.grey[200],
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
    color: Colors.white,
  );
  static final BoxDecoration  UnitBoxes = BoxDecoration(
    border: Border.all(
      width: 1,
      color: Colors.grey[200],
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 3,
        blurRadius: 4,
        offset: Offset(0, 1), // changes position of shadow
      ),
    ],
    color: Colors.white,
  );
  static final BoxDecoration MaterialUnitBoxContainer= BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier*2.7)),
    color: Constant.C_Purple,
  );
  static final BoxDecoration materialUnitCheckBox= BoxDecoration(
    borderRadius: BorderRadius.only(topRight: Radius.circular(SizeConfig.heightMultiplier*2.7),bottomRight:  Radius.circular(SizeConfig.heightMultiplier*2.7)),
    color: Constant.C_Purple,
  );
  static final TextStyle MaterialName = TextStyle(
    color: Constant.C_White,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 3.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle AllMaterialName = TextStyle(
    color: Constant.PrimaryColor,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 4.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle MaterialScore = TextStyle(
    color: Constant.C_White,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle MaterialNumberofScore = TextStyle(
    color: Constant.C_White,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,

  );
  static final TextStyle SplashScreenTitel = TextStyle(
    color: Constant.PrimaryColor,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 6 * SizeConfig.textMultiplier,
    height: 0.6 * SizeConfig.heightMultiplier,
    decoration: TextDecoration.none,
  );
  static final TextStyle MidSizeText = TextStyle(
    color: Constant.PrimaryColor,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 5 * SizeConfig.textMultiplier,
    height: 0.1 * SizeConfig.heightMultiplier,
    decoration: TextDecoration.none,

  );
  static final TextStyle SmallSizeText = TextStyle(
    color: Constant.PrimaryColor,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 3 * SizeConfig.textMultiplier,
    height: 0.17 * SizeConfig.heightMultiplier,
    decoration: TextDecoration.none,

  );
  static final TextStyle smallerSizeText = TextStyle(
    color: Constant.PrimaryColor,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.1 * SizeConfig.textMultiplier,
    height: 0.17 * SizeConfig.heightMultiplier,
    decoration: TextDecoration.none,

  );
}