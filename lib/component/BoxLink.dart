// Packages
import 'package:askarie/function/Home/readWriteLinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Constant
import 'package:askarie/constent/Color.dart';
// Themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';
// Screen
import '../screens/home.dart';

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
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 2,
          SizeConfig.widthMultiplier * 3,
          SizeConfig.heightMultiplier * 0.1),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        decoration:
        AppTheme.MaterialUnitBoxContainer.copyWith(color: MaterialColorArray[widget.index]),
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
                        FontAwesomeIcons.copy,
                        size: SizeConfig.textMultiplier *4 ,
                        color:C_White,
                      ),
                      onTap: (){
                        Clipboard.setData(new ClipboardData(text: widget.linKUrl)).then((result) {
                          final snackBar = SnackBar(
                            content: Text('تم نسخ الرابط'),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        });
                      },
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier*3,),
                    GestureDetector(
                      child: FaIcon(
                        FontAwesomeIcons.solidTrashAlt,
                        size: SizeConfig.textMultiplier *4 ,
                        color:C_White,
                      ),
                      onTap: (){
                        widget.parent.setState(() {
                          // Delete It From DataBase
                          deleteLink(widget.linKUrl);
                          // Show That it has been deleted
                          final snackBar = SnackBar(
                            content: Text('تم حذف الرابط'),
                            backgroundColor: Colors.red,
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                          // Change the Widget
                          Home.privetLink.removeAt(widget.index);
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
