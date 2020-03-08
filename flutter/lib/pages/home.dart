import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roshambo/config/Utils.dart';
import 'package:roshambo/config/assets.dart';
import 'package:roshambo/config/auth_repository.dart';
import 'package:roshambo/generated/l10n.dart';
import 'package:roshambo/pages/auth_page.dart';
import 'package:roshambo/pages/game_local.dart';
import 'package:roshambo/pages/game_multi.dart';

bool isMobile = false;

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
      isMobile = !kIsWeb;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    Widget _image(String name){
      return Image(image: AssetImage(name), width: 100, height: 100,);
    }
    Widget _icon(String name){
      return Image(image: AssetImage(name), width: 48, height: 48,);
    }

    Widget mobileAction = Column(
      children: <Widget>[
        RaisedButton(child: Text(S.of(context).gameActionExit), onPressed: ()=> SystemChannels.platform.invokeMethod('SystemNavigator.pop'),)
      ],
    );
    Widget webAction = Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(4.0),),
        RaisedButton(child: _icon(Assets.storeGoogle), onPressed: null,),
        Padding(padding: EdgeInsets.all(4.0),),
        RaisedButton(child: _icon(Assets.storeApple), onPressed: null,)
      ],
    );

    Widget buttonActions = Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          RaisedButton(child: Text(S.of(context).gameModeMulti), onPressed: ()=> Utils().newPage(context, AuthPage()),),
          RaisedButton(child: Text(S.of(context).gameModeLocal), onPressed: ()=> Utils().newPage(context, GamePageLocal()),),
          isMobile ? mobileAction :  webAction,
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(S.of(context).title, textAlign: TextAlign.center,),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image(Assets.choicePaper),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _image(Assets.choiceRock),
                      buttonActions,
                      _image(Assets.choiceScissors),
                    ],
                  ),
                  _image(Assets.choiceHands),
                ],
              ),),
            ),
          ),
        ),
      ),
    );
  }
}