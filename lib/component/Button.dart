// packages
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// Constant
import '../constent/Color.dart';

// Themes
import '../themes/AppTheme.dart';
import '../themes/size_config.dart';

class Button extends StatelessWidget {
  Button(this.text, this.function, this.buttonColor, this.textTheme,
      this.clikable);

  final Function function;
  final text;
  final buttonColor;
  final textTheme;
  bool clikable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: C_Purple, width: 1),
              color: buttonColor,
            ),
            child: InkWell(
              onTap: () {
                if (clikable) {
                  function();
                } else {}
              },
              child: Container(
                width: 25 * SizeConfig.widthMultiplier,
                height: 13 * SizeConfig.widthMultiplier,
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    text,
                    style: textTheme,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
