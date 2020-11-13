import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Show{
  static snackBar({@required context,@required String message ,@required color }){
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor:color,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}