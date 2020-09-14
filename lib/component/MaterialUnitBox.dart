// Packages
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// Constant
import 'package:askarie/constent/Color.dart';

// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

class MaterialUnitBox extends StatefulWidget {
  const MaterialUnitBox(this.materialName);
  final String materialName;
  @override
  _MaterialUnitBoxState createState() => _MaterialUnitBoxState();
}

class _MaterialUnitBoxState extends State<MaterialUnitBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 3,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 3),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
            AppTheme.MaterialUnitBoxContainer.copyWith(color: MaterialColorArray[1]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.widthMultiplier * 1,
              SizeConfig.heightMultiplier * 1,
              SizeConfig.widthMultiplier * 0.1,
              SizeConfig.heightMultiplier * 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.materialName,
                        style: AppTheme.MaterialName,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 12,
                      ),
                    ],
                  ),
                  // Material Name
                  Padding(
                    padding: EdgeInsets.fromLTRB(SizeConfig.widthMultiplier * 1,
                        SizeConfig.heightMultiplier * 1, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          '10/100 ',
                          style: AppTheme.MaterialScore,
                        ),
                        StepProgressIndicator(
                          totalSteps: 12,
                          currentStep: 2,
                          size: 8,
                          padding: 0,
                          selectedColor: C_White,
                          unselectedColor: C_TextGray,
                          progressDirection: TextDirection.ltr,
                          roundedEdges: Radius.circular(0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "10 سؤال ",
                style: AppTheme.MaterialNumberofScore,

              ),
              FaIcon(
                FontAwesomeIcons.arrowCircleLeft,
                size: SizeConfig.textMultiplier*5 ,
                color:C_White,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
