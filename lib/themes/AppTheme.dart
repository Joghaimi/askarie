// packages
import 'package:flutter/material.dart';

// Constent
import '../constent/Color.dart';

//Themes
import 'size_config.dart';


class AppTheme{
  static final TextStyle UnitName = TextStyle(
    color: C_TextGray,
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
    fontSize: 3.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle QestionAns  = TextStyle(
    color: C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle SelectType  = TextStyle(
    color: C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 3 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle UnitScore = TextStyle(
    color: C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 2.3 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle QestionsAndAnswersText = TextStyle(
    color: C_TextGray_Deep,
    fontFamily: 'ArbFONTS-Asmaa',
    fontSize: 3.5 * SizeConfig.textMultiplier,
    height: 0.15 * SizeConfig.heightMultiplier,
  );
  static final TextStyle Titel = TextStyle(
    color: Colors.white,
    fontFamily: 'samat',
    fontSize: 60,
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


}