import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import '../controller/linkScreenController.dart';
import '../model/constant.dart';
import '../model/sizeConfig.dart';
class LinkScreen extends StatefulWidget {
  static final id = 'LinkScreen';
  @override
  _LinkScreenState createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Constant.C_Gray,
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
                selectedBackgroundColors: [Constant.PrimaryColor],
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 2.3 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w700),
                unSelectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 2 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w500),
                labels: [Constant.K_privateLink, Constant.K_publicLink],
                selectedLabelIndex: (index) {
                  setState(() {
                    index == 0
                        ? LinkScreenController.showLinkType = true
                        : LinkScreenController.showLinkType = false;
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
                  LinkScreenController.returnLinkList(this),
                ],
              ),
            ),
          ],
        ),
      ),
//      bottomNavigationBar: MyBottomAppBar(Constant.C_White),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constant.PrimaryColor,
        onPressed: () {
          LinkScreenController.savePrivateLinkDialog(parent: this, context: context);
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



