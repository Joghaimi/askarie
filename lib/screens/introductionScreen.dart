// Packages
import 'package:askarie/constent/Color.dart';
import 'package:askarie/constent/UniName.dart';
import 'package:askarie/function/DealWithMaterial/LocalStorageSavedUnsavedMaterialpage.dart';
import 'package:askarie/function/SplashScreenFunction.dart';
import 'package:askarie/themes/size_config.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:select_dialog/select_dialog.dart';
import '../function/localStorage.dart';
// Screens
import 'AllMaterial.dart';
// Style


class IntroScreen extends StatefulWidget {
  static String id ="IntroScreen";
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
          "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('read.png'),
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
          "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('link.png'),
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
          "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('img1'),
        ),

      ],
      dotsDecorator: DotsDecorator(
          size: const Size.square(12.0),
          activeSize: const Size(24.0, 12.0),
          activeColor: PrimaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 5),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          )
      ),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => _onIntroEnd(context),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('images/$assetName', height: 60 * SizeConfig.imageSizeMultiplier,),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) {
    // Select the Uni
      String UNI = "";
      SelectDialog.showModal<String>(
        context,
        label: "اختيار الجامعه",
        selectedValue: UNI,
        items: uniName,
        onChange: (String selected) {
          setState(() {
            UNI = selected;
            print(UNI);
              //Save it IN Local Storage
            localStorage.SaveString("UNIName",UNI).then(
              // Get Data
                checkForNewMaterial().then(
                        (value) async{
                      await localStorageSavedUnsavedMaterialPage();
                      saveUniLink();
                      Navigator.pushReplacementNamed(context, AllMaterial.id);
                    }
                )
            );
          })
          ;
        },
      );
  }
}
