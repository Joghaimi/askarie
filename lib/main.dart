// package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//Screens
import 'screens/splash screen.dart';
import 'screens/units.dart';
import 'screens/MultibleChoice.dart';
import 'screens/QuestionsAndAnswer.dart';
import 'screens/AllMaterial.dart';
import 'screens/home.dart';
import 'screens/introductionScreen.dart';
// View
import 'mvc/view/splashscreen.dart';
import 'mvc/view/homeScreen.dart';
import 'mvc/view/firstUseScreen.dart';
import 'mvc/view/linkScreen.dart';
import 'mvc/view/materialScreen.dart';



// ADS
//import 'package:firebase_admob/firebase_admob.dart';
// Function
import 'function/Notification/push_notification.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
//  FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-9661386178168248~7055214624' );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    final DefaultCupertinoLocalizations localizations = CupertinoLocalizations.of(context);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"),
      ],
      initialRoute: SplashScreen.id,
      routes: {

        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        FirstUseScreen.id:(context) => FirstUseScreen(),
        LinkScreen.id:(context) => LinkScreen(),
        MaterialScreen.id:(context) => MaterialScreen(),

//        splash_screen.id: (context) => splash_screen(),
//        Units.id : (context) => Units(),
//        MultibleChoise.id : (context) => MultibleChoise(),
//        QuestionsAndAnswer.id : (context) => QuestionsAndAnswer(),
//        AllMaterial.id : (context) => AllMaterial(),
//        Home.id : (context) => Home(),
//        IntroScreen.id: (context) => IntroScreen(),
      },
    );
  }
}
