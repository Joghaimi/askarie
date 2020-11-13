import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';


import '../view/linkScreen.dart';
import '../view/component/boxLink.dart';
import '../view/component/publicLinkBox.dart';
import '../model/sizeConfig.dart';
import '../model/apptheme.dart';
import '../model/localStorage.dart';
import '../model/show.dart';
import '../model/constant.dart';
import '../model/db.dart';
import '../model/debug.dart';
import '../model/fromInternet.dart';
import '../model/readFile.dart';

class LinkScreenController {
  static List publicLink = [];
  static List privateLink = [];
  static bool showLinkType = false;
  static void initLinkScreen(parent, context) async {
    await createLinkDBIfNotExist();
    bool linkNotReadBefore = (publicLink.isEmpty && privateLink.isEmpty);
    if (linkNotReadBefore) {
      await readLink();
    }
    parent.setState(() {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => Navigator.pushNamed(context, LinkScreen.id));
    });
  }
  static Future<void> createLinkDBIfNotExist() async {
    DB baseHelper = DB();
    Debug.printSt("Check if link Table exist");
    bool findTheTable = await baseHelper.isExist(tableName: "link");
    Debug.printSt("link Table exist state $findTheTable");
    if (!findTheTable) {
        baseHelper.createDBTable(
          tableQuery:
              "CREATE TABLE IF NOT EXISTS link(id INTEGER PRIMARY KEY, LinkName TEXT,LinkURL TEXT, state TEXT)");
        LinkScreenController.downloadUniLink();
        Debug.printSt("create link Table");
    }
  }
  static Future<void> readLink() async {
    Debug.printSt("Read Link Table");
    DB baseHelper = DB();
    List privateLink = await baseHelper.readFromDB(
        sqlStmt: "Select * From link where state = ?  ", args: ['private']);
    List publicLink = await baseHelper.readFromDB(
        sqlStmt: "Select * From link where state = ?  ", args: ['public']);
    for (var link in privateLink) {
      var addLink = [link['LinkName'], link['LinkURL']];
      LinkScreenController.privateLink.add(addLink);
    }
    for (var link in publicLink) {
      var addLink = [link['LinkName'], link['LinkURL']];
      LinkScreenController.publicLink.add(addLink);
    }
  }
  static Widget returnLinkList(parent) {
    if (LinkScreenController.showLinkType) {
      if (LinkScreenController.privateLink.length > 0) {
        return ListView.builder(
            itemCount: LinkScreenController.privateLink.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return BoxLink(
                  parent,
                  index,
                  LinkScreenController.privateLink[index][0],
                  LinkScreenController.privateLink[index][1]);
            });
      } else {
        return Text(
          Constant.K_AddLink,
          style: AppTheme.MaterialName.copyWith(color: Color(0xFF4f518c)),
        );
      }
    } else{
      return Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 70,
            child: ListView.builder(
                itemCount: LinkScreenController.publicLink.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  // Return non Saved Material
                  return PublicBoxLink(
                      parent,
                      index,
                      LinkScreenController.publicLink[index][0],
                      LinkScreenController.publicLink[index][1]);
                }),
          ),
        ],
      );
    }
  }
  static void launchLink({@required context, @required String link}) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      Show.snackBar(
          context: context,
          message: Constant.K_CantOpenLink,
          color: Constant.C_Red);
    }
  }
  static void copyLink({@required context, @required String link}) {
    Clipboard.setData(new ClipboardData(text: link)).then((result) {
      Show.snackBar(
          context: context,
          message: Constant.K_LinkCopied,
          color: Constant.PrimaryColor);
    });
  }
  static deleteLink({@required context, @required String linkUrl, @required linkIndex}) {
    DB baseHelper = DB();
    baseHelper.delete(tableName: "link", where: "LinkURL = ?", args: null);
    LinkScreenController.privateLink.removeAt(linkIndex);
    Show.snackBar(
        context: context,
        message: Constant.K_LinkDeleted,
        color: Constant.C_Red);
  }
  static Future<void> saveLink({@required linkName, @required linkURL, @required linkState}) async {
    DB baseHelper = DB();
    await createLinkDBIfNotExist();
    var linkMap = Map<String, dynamic>();
    linkMap['LinkName'] = linkName;
    linkMap['LinkURL'] = linkURL;
    linkMap['state'] = linkState; // string
    await baseHelper.insert(mapInfo: linkMap, tableName: "link");
  }
  static void downloadUniLink() async {
    var uniName = await LocalStorage.getStringData(data: "UNIName");
    bool uniSelected = (uniName != "");
    if (uniSelected) {
      bool theirIsInternetConnection = await FromInternet.internetConnection();
      if (theirIsInternetConnection) {
        bool downloadState = await FromInternet.downloadFile(
            url: "http://joghaimi.com/kewy/$uniName/$uniName.json",
            fileName: "$uniName.json");
        if (downloadState) {
          String fullPath = "Temp/Kewy/Qata3a/";
          String fileName = '$uniName.json';
          var linkFile = await ReadFile.readFile(
              path: fullPath, fileName: fileName);
          bool fileReadSuccess = (linkFile != "");
          if (fileReadSuccess) {
            var jsonLinkCont = json.decode(linkFile)['link'];
            for (var link in jsonLinkCont) {
              await saveLink(linkName: link[0], linkURL: link[1], linkState: "public");
            }
            Debug.printSt("Links Saved");
          }
        }
      }
    }
  }
  static void savePrivateLinkDialog({@required parent ,@required context}){
    String linkTitle = "";
    String linkURL = "";
      customDialog(
    context,
    title: Text(
      "حفظ الرابط",
      style: AppTheme.UnitName.copyWith(color: Constant.PrimaryColor),
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
                  hintText: Constant.K_URLTitle,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.widthMultiplier * 0.1,
                      horizontal: SizeConfig.heightMultiplier * 0.2),
                  hintStyle: TextStyle(color: Constant.PrimaryColor),
                ),
                onChanged: (value) => linkTitle = value,
              ),
            ),
            Container(
              width: 40 * SizeConfig.widthMultiplier,
              child: TextField(
                decoration: InputDecoration(
                  hintText: Constant.K_URL,
                  hintStyle: TextStyle(color: Constant.PrimaryColor),
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
    positiveButtonText: Constant.K_Save,
    positiveButtonAction: () {
      bool notEmpty = (linkTitle!= "" && linkURL!= "");
      if(notEmpty){
        LinkScreenController.saveLink(linkName: linkTitle, linkURL: linkURL, linkState: 'private');
        parent.setState(() {
          LinkScreenController.privateLink.add([linkTitle, linkURL]); // Error
        });
        Navigator.pop(context);
      }

    },
    negativeButtonText: "الغاء",
    negativeButtonAction: () {
      Navigator.pop(context);
    },
    neutralButtonAction: () {
      Navigator.pop(context);
    },
    hideNeutralButton: true,
    closeOnBackPress: true,);
  }
  // @todo Check if their is new link's
  // @todo user Save public link
  // @ToDo Download link any time
}
