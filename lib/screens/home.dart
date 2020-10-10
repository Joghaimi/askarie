// Packages
import 'package:askarie/component/BoxLink.dart';
import 'package:askarie/component/Button.dart';
import 'package:askarie/component/DownloadMaterialUnitBox.dart';
import 'package:askarie/themes/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fialogs/fialogs.dart';



// Constant
import 'package:askarie/constent/Color.dart';
import 'package:askarie/constent/Text.dart';

// Component
import 'package:askarie/component/MyBottomAppBar.dart';

// Themes
import 'package:askarie/themes/size_config.dart';

class Home extends StatefulWidget {
  static final id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: C_Gray,
        width: 100 * SizeConfig.widthMultiplier,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
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
                selectedBackgroundColors: [PrimaryColor],
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 2.3 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w700),
                unSelectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 2 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w500),
                labels: [K_privateLink, K_publicLink],
                selectedLabelIndex: (index) {
                  print("Selected Index $index");
                },
              ),
            ),
            SizedBox(height: 40,),
            Flexible(
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                      itemCount: 12,
                      itemBuilder: (BuildContext ctxt, int index){
                        // Return non Saved Material
                         return BoxLink(index,"ahmad","ahmad");

                      }),
                ],
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(C_White),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PrimaryColor,
        onPressed: () {
          saveLinkDialog(context);
          //_settingModalBottomSheet(context);
        },
        icon: Icon(Icons.save),
        label: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text("حفظ"),
        ),
      ),
    );
  }
}


void saveLinkDialog(context){
  customDialog(
    context,
    title: Text(
      "حفظ الرابط",
      style:
      AppTheme.UnitName.copyWith(color: PrimaryColor),
    ),
    content: Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              2 * SizeConfig.widthMultiplier,
              2 * SizeConfig.heightMultiplier,
              2 * SizeConfig.widthMultiplier,
              2 * SizeConfig.heightMultiplier),
          child: Image.asset(
            "images/manonchair.png",
            height: 40 * SizeConfig.imageSizeMultiplier,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40 * SizeConfig.widthMultiplier,
              child: TextField(
                decoration: InputDecoration(
                  hintText: K_URLTitle,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.widthMultiplier * 0.1,
                      horizontal:
                      SizeConfig.heightMultiplier * 0.2),
                  hintStyle: TextStyle(color: PrimaryColor),
                ),
              ),
            ),
            Container(
              width: 40 * SizeConfig.widthMultiplier,
              child: TextField(
                decoration: InputDecoration(
                  hintText: K_URL,
                  hintStyle: TextStyle(color: PrimaryColor),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.widthMultiplier * 0.1,
                      horizontal:
                      SizeConfig.heightMultiplier * 0.2),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    positiveButtonText: K_Save,
    positiveButtonAction: () {},
    negativeButtonText: "الغاء",
    negativeButtonAction: () { Navigator.pop(context);},
    neutralButtonAction: () {
      Navigator.pop(context);
    },
    hideNeutralButton: true,
    closeOnBackPress: true,
  );
}