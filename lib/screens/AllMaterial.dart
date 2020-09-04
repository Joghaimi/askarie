// packages
import 'package:flutter/material.dart';
// Constant
import '../constent/Color.dart';
// Component
import '../component/MyBottomAppBar.dart';
import '../component/MaterialUnitBox.dart';

class AllMaterial extends StatefulWidget {
  static final id = "AllMaterial";

  @override
  _AllMaterialState createState() => _AllMaterialState();
}

class _AllMaterialState extends State<AllMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: SecondryColor,
        child: MaterialUnitBox(),
    ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
