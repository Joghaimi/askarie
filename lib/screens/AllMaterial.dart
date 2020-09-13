// packages
import 'package:flutter/material.dart';
// Constant
import '../constent/Color.dart';
// Component
import '../component/MyBottomAppBar.dart';
import '../component/MaterialUnitBox.dart';
// Themes
import '../themes/size_config.dart';
// Function
import '../function/localStorage.dart';

class AllMaterial extends StatefulWidget {
  static final id = "AllMaterial";
  static var AllMaterials   = new List(100);
  static var AllMaterialNum =0;




  @override
  _AllMaterialState createState() => _AllMaterialState();
}

class _AllMaterialState extends State<AllMaterial> {
  @override
  void initState() {
    // check if data downloaded or not
//    checkDataFromLocal();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: SecondryColor,
        child: Column(
          children: [
            MaterialUnitBox(),
            Flexible(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 20 * SizeConfig.widthMultiplier,
                  ),
                  ListView.builder(
                      itemCount: (AllMaterial.AllMaterialNum-1)>=0?(AllMaterial.AllMaterialNum-1):0,
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
                            Text(AllMaterial.AllMaterials[index]),
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
  checkDataFromLocal()async{

    // TODO move ALL this Function to Splash Screen at TODO NUM#1
    for (var i=0 ; (AllMaterial.AllMaterialNum-1)>i;i++){
      var isMat = localStorage.getDataString(AllMaterial.AllMaterials[i]);

//        if (isMat != 0) {
////        localStorage.SaveStringArray(await AllMaterial.AllMaterials[i],datatosave.toString());
//          print("Local Storage save ${AllMaterial.AllMaterials[i]}");
//        } else {
//          print("save Non");
//        }
//      }
//    );
//      List<String> datatosave=new List();
//      datatosave.add('');
//      datatosave.add('');
//      if(isMat != 0){
////        localStorage.SaveStringArray(await AllMaterial.AllMaterials[i],datatosave.toString());
//        print("Local Storage save ${AllMaterial.AllMaterials[i]}");
//      }else{
//        print("save Non");
//      }
    }
  }
}
