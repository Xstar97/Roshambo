import 'package:flutter/material.dart';
import 'package:roshambo/config/constants.dart';
import 'package:roshambo/generated/l10n.dart';
import 'package:roshambo/pages/base_game.dart';

class GamePageOnline extends StatefulWidget {

  @override
  _GamePageOnlineState createState() => _GamePageOnlineState();
}
class _GamePageOnlineState extends State<GamePageOnline> {

  var title, playerNameOne, playerNameTwo;
  var mode;

  @override
  void initState() {
    mode = GameMode.Online;
    playerNameOne = "1";
    playerNameTwo = "2";
    super.initState();
  }

  @override
  void didChangeDependencies() {
    title = S.of(context).gameModeOnline;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return BaseGamePage(
      title: title,
      mode: mode,
      playerNameOne: playerNameOne,
      playerNameTwo: playerNameTwo,
    );
  }
}