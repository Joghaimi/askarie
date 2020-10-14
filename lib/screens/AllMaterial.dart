// packages
import 'package:flutter/material.dart';
// Constant
import '../constent/Color.dart';
// Component
import '../component/MyBottomAppBar.dart';
import '../component/MaterialUnitBox.dart';
import '../component/DownloadMaterialUnitBox.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';


class AllMaterial extends StatefulWidget {
  static final id = "AllMaterial";
  static bool Ready = false;

  static var AllMaterialNum=0;
  static var SavedMaterial =  new List(100);
  static var SavedMaterialNum =0;

  static var NonSavedMaterial =  new List(100);
  static var NonSavedMaterialNum =0;




  @override
  _AllMaterialState createState() => _AllMaterialState();
}

class _AllMaterialState extends State<AllMaterial> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: SecondryColor,
        child: Column(
          children: [
            SizedBox( height: 7 * SizeConfig.heightMultiplier,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5 * SizeConfig.heightMultiplier, 0, 0),
                  child: Text(
                    'جميع المواد',
                    style: AppTheme.AllMaterialName,
                  ),
                ),
                SizedBox(
                  width: 18* SizeConfig.widthMultiplier,
                ),
                Image.asset("images/UnitScreen.png",),

              ],
            ),
            SizedBox(
              height: 10 * SizeConfig.widthMultiplier,
            ),
            Flexible(
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                      itemCount: (AllMaterial.AllMaterialNum-1)>=0?(AllMaterial.AllMaterialNum-1):0,
                      itemBuilder: (BuildContext ctxt, int index){
                        if(AllMaterial.SavedMaterialNum -1>= index){
                          // Return saved Material
                          return MaterialUnitBox(AllMaterial.SavedMaterial[index],MaterialColorArray[index]);
                        }else{
                          // Return non Saved Material
                          return DownloadMaterialUnitBox(AllMaterial.NonSavedMaterial[(index-(AllMaterial.SavedMaterialNum))]!=null?AllMaterial.NonSavedMaterial[(index-(AllMaterial.SavedMaterialNum))]:"");
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
    ),
      bottomNavigationBar: MyBottomAppBar(C_White),
    );
  }
}