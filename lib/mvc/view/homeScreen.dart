import 'package:flutter/material.dart';
import '../controller/linkScreenController.dart';
class HomeScreen extends StatefulWidget {
  static final id = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child: Text("Ahmad"),
        onPressed: (){
          LinkScreenController.initLinkScreen(this,context);
//          LinkScreenController.downloadUniLink();
        },
      ),
    );
  }
}
