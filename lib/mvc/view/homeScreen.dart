import 'package:askarie/mvc/model/constant.dart';
import 'package:flutter/material.dart';
import '../view/component/unitBox.dart';
import '../controller/materialController.dart';

class HomeScreen extends StatefulWidget {
  static final id = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constant.C_Gray,
      child: Column(
        children: [
          Text("ahm"),
          FloatingActionButton(
            child: Text("Ahmad"),
            onPressed: (){
              MaterialController.initMaterialPage(this,context);

            },
          ),
        ],
      ),

    );
  }
}
