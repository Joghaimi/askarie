// packages
import 'package:flutter/material.dart';

// Constant
import '../constent/Color.dart';

// Themes
import '../themes/AppTheme.dart';

class Button extends StatelessWidget {
  Button(this.text, this.function);

  final Function function;
  final text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 0.0),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          elevation: 18.0,
          color: C_Purple,
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
            onPressed: function,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(text, style: AppTheme.Button),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
