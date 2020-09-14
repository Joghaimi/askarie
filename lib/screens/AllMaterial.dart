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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: SecondryColor,
        child: Column(
          children: [
            MaterialUnitBox(),
            Flexible(
              flex: 3,

              child: Stack(

                children: <Widget>[
                  Container(
                    child: Text("المواد"),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.widthMultiplier,
                  ),
                  ListView.builder(
                      itemCount: (AllMaterial.AllMaterialNum-1)>=0?(AllMaterial.AllMaterialNum-1):0,
                      itemBuilder: (BuildContext ctxt, int index) {
                        if(AllMaterial.SavedMaterialNum -1>= index){
                          print("Saved");
                          print(index);
                        }else{
                          print("Non Saved");
                          print(index-AllMaterial.SavedMaterialNum);
                        }


                        return Column(
                          children: <Widget>[
                            index == 0
                                ? SizedBox(
                              height:
                              8 * SizeConfig.heightMultiplier,
                            )
                                : SizedBox(
                              height:
                              0.4 * SizeConfig.heightMultiplier,
                            ),
//                            Text(AllMaterial.SavedMaterial[index]),
                          ],
                        );
                      }),
                ],
              ),
            ),
            Container(
              child: Text("مواد جديده"),
            ),
            Flexible(
              flex: 2,
              child: Stack(
                children: <Widget>[

                  ListView.builder(
                      itemCount: (AllMaterial.NonSavedMaterialNum-1)>=0?(AllMaterial.NonSavedMaterialNum-1):0,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Column(
                          children: <Widget>[
                            index == 0
                                ? SizedBox(
                              height:
                              8 * SizeConfig.heightMultiplier,
                            )
                                : SizedBox(
                              height:
                              0.4 * SizeConfig.heightMultiplier,
                            ),
                            DownloadMaterialUnitBox(AllMaterial.NonSavedMaterial[index]),
                          ],
                        );
                      }),
                ],
              ),
            ),

          ],
        ),
    ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
/*
* Saved Section open new page
* Non Save Section Use it to download and save Database
* create Function To show the downloaded file First then  the non Downloaded file @ToDO
* */