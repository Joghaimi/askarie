import 'package:flutter/material.dart';
import '../model/sizeConfig.dart';
import '../model/constant.dart';
import '../model/apptheme.dart';
import '../controller/materialController.dart';

class MaterialScreen extends StatefulWidget {
  static final id="Material";
  @override
  _MaterialScreenState createState() => _MaterialScreenState();
}
class _MaterialScreenState extends State<MaterialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constant.SecondryColor,
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
                    Constant.K_AllMaterial,
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
                  MaterialController.returnMaterialList(),

                ],
              ),
            ),
          ],
        ),
      ),
//      bottomNavigationBar: MyBottomAppBar(C_White),
    );
  }
}
