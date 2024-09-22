import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation{
  static void gopush(context,Widget screen)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
  }
  
  
}