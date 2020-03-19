import 'package:flutter/material.dart';

class Utils
{
  Widget assetImage(String name, double size){
    return Image(image: AssetImage(name), width: size, height: size,);
  }
  void newPage(BuildContext context, Widget page){
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}