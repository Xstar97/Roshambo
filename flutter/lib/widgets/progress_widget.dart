import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildWaitingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}