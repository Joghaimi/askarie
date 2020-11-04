// Packages
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// fUNCTION
import '../function/DB/DataBaseHelper.dart';
import '../function/DealWithMaterial/getSetScore.dart';

// Constant
import 'package:askarie/constent/Color.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

// Screens
import '../screens/units.dart';

class MaterialUnitBox extends StatefulWidget {
  const MaterialUnitBox(this.materialName, this.boxColor);
  final String materialName;
  final boxColor;
  @override
  _MaterialUnitBoxState createState() => _MaterialUnitBoxState();
}

class _MaterialUnitBoxState extends State<MaterialUnitBox> {
  int materialQSNum;
  Widget iconPlace =FaIcon(
    FontAwesomeIcons.arrowCircleLeft,
    size: SizeConfig.textMultiplier*5 ,
    color:C_White,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: GestureDetector(
        child: Container(
          height: SizeConfig.heightMultiplier * 10,
          decoration:
              AppTheme.MaterialUnitBoxContainer.copyWith(color: widget.boxColor),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.widthMultiplier * 1,
                SizeConfig.heightMultiplier * 1,
                SizeConfig.widthMultiplier * 0.1,
                SizeConfig.heightMultiplier * 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
                  child: Text(
                    widget.materialName,
                    style: AppTheme.MaterialName,
                  ),
                ),
                Expanded(child: Text(""),),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                  child: iconPlace,
                ),
              ],
            ),
          ),
        ),
        onTap: ()async{
          // Change Icon To loading Icon
          setState(() {iconPlace= ColoredCircularProgressIndicator();});
          // Save All Unit Name
          DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
          var material_name = await baseHelper.getUnitName(widget.materialName);
          // Go To Unit Page
          Units.materialName=widget.materialName;
          // Empty the array
          Units.UnitName.clear();
          var cont = 0;
          var savedUnitname;
          for(var material in material_name){
            if(! Units.UnitName.contains(material['UnitName'])){
              Units.UnitName.add(material['UnitName']); // Unit Name
              Units.unitScore.add(await getUnitScore(widget.materialName, material['UnitName'])); //@todo It save 0 Data
//              print(await getUnitScore(widget.materialName, material['UnitName']));
              cont ++ ;
            }
          }
          Units.unitNumber=cont;
          Navigator.pushReplacementNamed(context, Units.id);
          //return icon to what it was
          setState(() {iconPlace= FaIcon(
            FontAwesomeIcons.arrowCircleLeft,
            size: SizeConfig.textMultiplier*5 ,
            color:C_White,
          );});
        },
      ),
    );
  }
}