// Packages
import 'package:askarie/component/PublicBoxLink.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fialogs/fialogs.dart';

// Constant
import 'package:askarie/constent/Color.dart';
import 'package:askarie/constent/Text.dart';

// Component
import 'package:askarie/component/MyBottomAppBar.dart';
import '../component/downloadLinkUnitBox.dart';
import 'package:askarie/component/BoxLink.dart';

// Themes
import 'package:askarie/themes/size_config.dart';
import 'package:askarie/themes/AppTheme.dart';

// Function
import '../function/Home/readWriteLinks.dart';

class Home extends StatefulWidget {
  static final id = 'home';
  static var privetLink =
      []; // Get Links from dataBase and save them in this place
  static var publicLinkToDownload =
      []; // Get Links from dataBase and save them in this place
  static var publicLink =
      []; // Get Links from dataBase and save them in this place
  bool privatePublic = true;

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
                  setState(() {
                    index == 0
                        ? widget.privatePublic = true
                        : widget.privatePublic = false;
                  });
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 4.2,
            ),
            Flexible(
              child: Stack(
                children: <Widget>[
                  listReturn(this, widget.privatePublic),
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
          saveLinkDialog(this, context);
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

void saveLinkDialog(parent, context) {
  String linkTitle;
  String linkURL;
  customDialog(
    context,
    title: Text(
      "حفظ الرابط",
      style: AppTheme.UnitName.copyWith(color: PrimaryColor),
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
                      horizontal: SizeConfig.heightMultiplier * 0.2),
                  hintStyle: TextStyle(color: PrimaryColor),
                ),
                onChanged: (value) => linkTitle = value,
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
                      horizontal: SizeConfig.heightMultiplier * 0.2),
                ),
                onChanged: (value) => linkURL = value,
              ),
            ),
          ],
        ),
      ],
    ),
    positiveButtonText: K_Save,
    positiveButtonAction: () {
      // Save Link in DB
      writeLink('private', linkTitle, linkURL);
      // Update Widget
      parent.setState(() {
        Home.privetLink.add([linkTitle, linkURL]); // Error
      });
      Navigator.pop(context);
    },
    negativeButtonText: "الغاء",
    negativeButtonAction: () {
      Navigator.pop(context);
    },
    neutralButtonAction: () {
      Navigator.pop(context);
    },
    hideNeutralButton: true,
    closeOnBackPress: true,
  );
}

listReturn(parent, bool privatePublic) {
  if (privatePublic) {
    // PrivateLink Return
    if (Home.privetLink.length > 0) {
      return ListView.builder(
          itemCount: Home.privetLink.length,
          itemBuilder: (BuildContext ctxt, int index) {
            // Return non Saved Material
            return BoxLink(parent, index, Home.privetLink[index][0],
                Home.privetLink[index][1]);
          });
    } else {
      return Text(
        "قم بأضافة روابط",
        style: AppTheme.MaterialName.copyWith(color: Color(0xFF4f518c)),
      );
    }
  } else {
    // Public
      print(Home.publicLink.length);
      return Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier*50,
            child: ListView.builder(
                itemCount: Home.publicLink.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  // Return non Saved Material
                  return PublicBoxLink(parent, index, Home.publicLink[index][0],
                      Home.publicLink[index][1]);
                }),
          ),
          Container(
            height: SizeConfig.heightMultiplier*20,
            child: ListView.builder(
                itemCount: Home.publicLinkToDownload.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  // Return non Saved Material
                  return DownloadLink(parent, Home.publicLinkToDownload[index]);
                }),
          ),
        ],
      );

  }
}
