// package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//Screens
import 'screens/splash screen.dart';
import 'screens/units.dart';
import 'screens/MultibleChoice.dart';
import 'screens/QuestionsAndAnswer.dart';

// ADS
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'function/ads.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-9661386178168248~7055214624' );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  /// ToDo :
  ///  --- Edit Sizing
  ///  --- Create MockUp Screens                       --> Done
  ///      - Create MockeUP For Qestions and Search
  ///      - Create all images needed
  ///   5- Create All things For Android PlayStore     --> Done
  ///   6- Add Addmob
  ///   *************ADDMOB Information ***************
  ///   - APPID : ca-app-pub-9661386178168248~2297648329
  ///   7- Add Make Random Test                        --> MayNotBeNeeded
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
      initialRoute: splash_screen.id,
      routes: {
        splash_screen.id: (context) => splash_screen(),
        Units.id : (context) => Units(),
        MultibleChoise.id : (context) => MultibleChoise(),
        QuestionsAndAnswer.id : (context) => QuestionsAndAnswer(),
      },
    );
  }
}
