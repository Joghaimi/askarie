// package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//Screens
import 'screens/splash screen.dart';
import 'screens/units.dart';
import 'screens/MultibleChoice.dart';
import 'screens/QuestionsAndAnswer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  /// ToDo :
  ///   1- Create Logo For the Application             --> Done
  ///   2- Create MockUp Screens                       --> Done
  ///      - Create MockeUP For Qestions and Search
  ///   3- Remove SplashScreens                        --> Done
  ///   4- Change the pages Depends on the Logo        --> Done
  ///   5- Create All things For Android PlayStore     --> Done
  ///   6- Add Addmob
  ///   *************ADDMOB Information ***************
  ///   - APPID : ca-app-pub-9661386178168248~2297648329
  ///   -
  ///   7- Add Make Random Test                        --> MayNotBeNeeded
  ///   8- Add Share The App Button                    --> Done
  ///   9- Create SharePage In Joghaimi.com            --> Done
  ///   9- Make the BackButton make the ChoseWindow Display None --> Done
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
