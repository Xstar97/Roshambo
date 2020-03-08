import 'package:flutter/material.dart';

class Utils
{
  void newPage(BuildContext context, Widget page){
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}