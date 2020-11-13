import 'package:flutter/material.dart';
import 'package:select_dialog/select_dialog.dart';

import '../model/sizeConfig.dart';
import '../model/constant.dart';
import '../model/localStorage.dart';
import '../view/splashscreen.dart';


class FirstUseScreenController{
  static Widget buildImage(String assetName) {
    return Align(
      child: Image.asset('images/$assetName', height: 60 * SizeConfig.imageSizeMultiplier,),
      alignment: Alignment.bottomCenter,
    );
  }
  static void onIntroEnd(parent,context) {
    String universityName ="";
    parent.setState((){
      SelectDialog.showModal(
        context,
        label: Constant.K_ChoseUniversity,
        selectedValue: universityName,
        items: Constant.uniName,
        onChange: (String selected){
          parent.setState(() async{
            universityName = selected;
            await LocalStorage.saveStringData(data: "UNIName", value: universityName);
            parent.setState(() {
              WidgetsBinding.instance.addPostFrameCallback(
                      (_) => Navigator.pushNamed(context, SplashScreen.id));
            });
          })
          ;
        },
      );
    });


  }
}
