import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Themes
import '../../model/sizeConfig.dart';
import '../../model/AppTheme.dart';
import '../../controller/linkScreenController.dart';
import '../../model/constant.dart';

class PublicBoxLink extends StatefulWidget {
  final int index ;
  final String linkTitle;
  final String linKUrl;
  final parent;
  const PublicBoxLink(this.parent,this.index, this.linkTitle,this.linKUrl);

  @override
  _PublicBoxLinkState createState() => _PublicBoxLinkState();
}
class _PublicBoxLinkState extends State<PublicBoxLink> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color: Constant.MaterialColorArray[widget.index]),
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.widthMultiplier * 1,
                    SizeConfig.heightMultiplier * 1,
                    SizeConfig.widthMultiplier * 4,
                    SizeConfig.heightMultiplier * 1),
                child: Text(
                  widget.linkTitle,
                  style: AppTheme.MaterialName,
                ),
              ),
              Expanded(child: Text(""),),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.widthMultiplier * 3,
                    SizeConfig.heightMultiplier * 0.1,
                    SizeConfig.widthMultiplier * 1,
                    SizeConfig.heightMultiplier * 0.1),
                child: Row(
                  children: [
                    GestureDetector(
                      child: FaIcon(
                        FontAwesomeIcons.externalLinkAlt,
                        size: SizeConfig.textMultiplier *4 ,
                        color:Constant.C_White,
                      ),
                      onTap: () async{
                        LinkScreenController.launchLink(context: context, link: widget.linKUrl);
                      },
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier*3,),
                    GestureDetector(
                      child: FaIcon(
                        FontAwesomeIcons.copy,
                        size: SizeConfig.textMultiplier *4 ,
                        color:Constant.C_White,
                      ),
                      onTap: (){
                        LinkScreenController.copyLink(context: context, link: widget.linKUrl);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
