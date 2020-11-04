// Packages
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Function
import '../function/RandomNum.dart';
import '../function/DB/DataBaseHelper.dart';
// Function DataBase
import '../function/DealWithMaterial/downloadMaterialAndCreateTable.dart';
// Constant
import 'package:askarie/constent/Color.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';
// Screens
import '../screens/units.dart';
class DownloadMaterialUnitBox extends StatefulWidget {
  final String materialName;
  const DownloadMaterialUnitBox(this.materialName);
  @override
  _DownloadMaterialUnitBoxState createState() => _DownloadMaterialUnitBoxState();
}

class _DownloadMaterialUnitBoxState extends State<DownloadMaterialUnitBox> {
  Widget IconPlace = FaIcon(
    FontAwesomeIcons.arrowCircleDown,
    size: SizeConfig.textMultiplier *5 ,
    color:C_White,
  );
  bool onTabCondition = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color: MaterialColorArray[RandomNum()]),
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
                padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
                child: Text(
                  widget.materialName,
                  style: AppTheme.MaterialName,
                ),
              ),
              Expanded(child: Text(""),),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                  child: IconPlace,
                ),
                onTap:onTabCondition? ()async{
                  // Start Downloading and Change the Icon
                  // -- ChangeIcon
                  setState(() {
                    IconPlace= ColoredCircularProgressIndicator();
                  });
                  // Disable The appilitty to click
                  onTabCondition=false;
                  var downloadState = await downloadMaterialAndCreateTable(widget.materialName);
                  print("Download MaterialFinashed ");
                  // Open The New View
                  if(downloadState){
                    setState(() {
                      IconPlace= GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.arrowCircleLeft,
                          size: SizeConfig.textMultiplier *5 ,
                          color:C_White,
                        ),
                        onTap: ()async{
                          setState(() {IconPlace= ColoredCircularProgressIndicator();});
                          // Save All Unit Name
                          DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
                          var material_name = await baseHelper.getUnitName(widget.materialName);
                          Units.materialName=widget.materialName;
                          // Empty the array
                          Units.UnitName.clear();
                          var cont = 0;
                          var savedUnitname;
                          print("UNITNAME Fitsh After Downloading");
                          for(var material in material_name){
                            // DataFitch
                            if(! Units.UnitName.contains(material['UnitName'])){
                              Units.UnitName.add(material['UnitName']);
                              Units.unitScore.add(0);
                              print(material['UnitName']);
                              cont ++ ;
                              }
                          }
                          print("UNITNAME Fitsh After Downloading");
                          Units.unitNumber=(cont-1);
                          print(cont);
                          print(Units.UnitName.length);
                          Navigator.pushReplacementNamed(context, Units.id);
                        },
                      );
                    });
                  }
                  // Enable The Click again
                }:null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}