import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roshambo/config/Utils.dart';
import 'package:roshambo/config/assets.dart';
import 'package:roshambo/config/auth_repository.dart';
import 'package:roshambo/generated/l10n.dart';
import 'package:roshambo/pages/auth_page.dart';
import 'package:roshambo/pages/game_offline.dart';
import 'package:roshambo/pages/game_online.dart';
import 'package:roshambo/widgets/responsive_widget.dart';

bool isMobile = false;
var utils = Utils();
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

    Widget mobileAction(double fontSize) {
      return Column(
        children: <Widget>[
          RaisedButton(child: Text(S.of(context).gameActionExit, style: TextStyle(fontSize: fontSize)),
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),)
        ],
      );
    }
    Widget webAction(double iconSize) {
      return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(4.0),),
          RaisedButton(child: Row(children: <Widget>[
            utils.assetImage(Assets.storeGoogle, iconSize),
            utils.assetImage(Assets.storeApple, iconSize)
          ],), onPressed: null,),
        ],
      );
    }
    Widget buttonActions(double iconSize, double fontSize) {
        return Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              RaisedButton(child: Text(S.of(context).gameModeOnline, style: TextStyle(fontSize: fontSize),),
                onPressed: () => Utils().newPage(context, AuthPage()),),
              Padding(padding: EdgeInsets.all(5),),
              RaisedButton(child: Text(S.of(context).gameModeOffline, style: TextStyle(fontSize: fontSize)),
                onPressed: () => Utils().newPage(context, GamePageOffline()),),
              isMobile ? mobileAction(fontSize) : webAction(iconSize),
            ],
          ),
        );
      }

    Widget homeView(double imageSize, double iconSize, double fontSize){
        return Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Center(child: Text(S.of(context).title, textAlign: TextAlign.center,),),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        utils.assetImage(Assets.choicePaper, imageSize),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            utils.assetImage(Assets.choiceRock, imageSize),
                            buttonActions(iconSize, fontSize),
                            utils.assetImage(Assets.choiceScissors, imageSize),
                          ],
                        ),
                        utils.assetImage(Assets.choiceHands, imageSize),
                      ],
                    ),),
                ),
              ),
            ),
          ),
        );
      }

      return ResponsiveWidget(
        largestScreen: homeView(200, 96, 48),
        largeScreen: homeView(150, 72, 40),
        mediumScreen: homeView(100, 48, 32),
        smallScreen: homeView(50, 36, 14),
        smallestScreen: homeView(25, 24, 12),
      );
  }
}