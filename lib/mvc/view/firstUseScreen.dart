import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../controller/FirstUseScreenController.dart';
import '../model/constant.dart';
class FirstUseScreen extends StatefulWidget {
  static final id = 'firstUseScreen';
  @override
  _FirstUseScreenState createState() => _FirstUseScreenState();
}
class _FirstUseScreenState extends State<FirstUseScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: Constant.K_intro,
          body:Constant.K_introTXT,
          image: FirstUseScreenController.buildImage('introPage1.jpg'),
        ),
        PageViewModel(
          title: Constant.K_MaterialLib,
          body:Constant.K_MaterialLibTXT,
          image: FirstUseScreenController.buildImage('read.png'),
        ),
        PageViewModel(
          title: Constant.K_LinkLib,
          body:  Constant.K_LinkLibTXT,
          image: FirstUseScreenController.buildImage('link.png'),
        ),
        PageViewModel(
          title: Constant.AppName,
          body:
          Constant.K_IntroFinalTXT,
          image: FirstUseScreenController.buildImage('introPage2.jpg'),
        ),
      ],
      dotsDecorator: DotsDecorator(
          size: const Size.square(12.0),
          activeSize: const Size(24.0, 12.0),
          activeColor: Constant.PrimaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 5),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          )
      ),
      done: Text(Constant.K_IntroFinish, style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => FirstUseScreenController.onIntroEnd(this,context),
    );
  }
}
