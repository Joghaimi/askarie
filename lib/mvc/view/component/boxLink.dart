// Packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Constant
import '../../model/apptheme.dart';
import '../../model/sizeConfig.dart';
import '../../model/constant.dart';
import '../../controller/linkScreenController.dart';
import '../../model/getRandom.dart';
import 'package:askarie/function/RandomNum.dart';

class BoxLink extends StatefulWidget {
  final int index ;
  final String linkTitle;
  final String linKUrl;
  final parent;
  const BoxLink(this.parent,this.index, this.linkTitle,this.linKUrl);
  @override
  _BoxLinkState createState() => _BoxLinkState();
}

class _BoxLinkState extends State<BoxLink> {
  @override
  Widget build(BuildContext context) {
    final boxColor =  Constant.MaterialColorArray[widget.index < Constant.MaterialColorArray.length?widget.index:GetRandom.colorIndex()];
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color:boxColor),
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
                        size : SizeConfig.textMultiplier *4 ,
                        color: Constant.C_White,
                      ),
                      onTap: ()async{
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
                        LinkScreenController.copyLink(context: context, link: widget.linKUrl);},
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier*3,),
                    GestureDetector(
                      child: FaIcon(
                        FontAwesomeIcons.solidTrashAlt,
                        size: SizeConfig.textMultiplier *4 ,
                        color:Constant.C_White,
                      ),
                      onTap: (){
                        widget.parent.setState(() {
                          LinkScreenController.deleteLink(context: context, linkUrl: widget.linKUrl, linkIndex: widget.index);
                        });
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
