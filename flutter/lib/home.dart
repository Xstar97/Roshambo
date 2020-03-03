import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roshambo/game.dart';

import 'generated/l10n.dart';

bool isMobile = false;
const ASSETS_IMAGES = "resources/choices/";
const ASSETS_ICONS = "resources/icons/";

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
      return Image(image: AssetImage("$ASSETS_IMAGES$name"), width: 100, height: 100,);
    }
    Widget _icon(String name){
      return Image(image: AssetImage("$ASSETS_ICONS$name"), width: 48, height: 48,);
    }

    Widget mobileAction = Column(
      children: <Widget>[
        RaisedButton(child: Text(S.of(context).gameActionExit), onPressed: ()=> SystemChannels.platform.invokeMethod('SystemNavigator.pop'),)
      ],
    );
    Widget webAction = Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(4.0),),
        RaisedButton(child: _icon("play_store.png"), onPressed: null,),
        Padding(padding: EdgeInsets.all(4.0),),
        RaisedButton(child: _icon("app_store.png"), onPressed: null,)
      ],
    );

    Widget buttonActions = Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          RaisedButton(child: Text(S.of(context).gameModeMulti), onPressed: null,),
          RaisedButton(child: Text(S.of(context).gameModeLocal), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => GamePageLocal())),),
          isMobile ? mobileAction :  webAction,
        ],
      ),
    );

    Widget body = Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _image("paper.png"),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _image("rock.png"),
            buttonActions,
            _image("scissors.png"),
          ],
        ),
        _image("hands.png"),
      ],
    ));
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(S.of(context).title, textAlign: TextAlign.center,),),
      ),
      body: Center(
        child: body,
      ),
    );
  }
}