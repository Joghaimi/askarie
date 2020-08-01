// packages
import 'package:flutter/material.dart';
// Constant
import '../constent/Color.dart';
import '../constent/Text.dart';

// Themes
import '../themes/AppTheme.dart';
//Screens
import '../screens/units.dart';
class MyAppBar extends StatefulWidget {
  bool isSearching = false;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: C_Purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // TO Do When This is Pressed
                  widget.isSearching = !widget.isSearching;
                  print('MotherFucker');
                });
              },
              child: Icon(
                !widget.isSearching ? Icons.search : Icons.cancel,
                color: Colors.white,
                size: !widget.isSearching ? 50 : 30,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: widget.isSearching
                ? TextField(

              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              onSubmitted: (String search){
                setState(() {
                  Units.Search =true;
                });
                print("Srearch Done MotherFucker");
              },
              decoration: InputDecoration(
                hintText: "احمد يبحث",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),

              ),
            )
                : Text(""),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                !widget.isSearching ? AppName : "",
                style: AppTheme.Titel.copyWith(fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
