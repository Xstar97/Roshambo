import 'package:flutter/material.dart';
import 'package:roshambo/config/constants.dart';
import 'package:roshambo/generated/l10n.dart';
import 'package:roshambo/pages/base_game.dart';

class GamePageOffline extends StatefulWidget {

  @override
  _GamePageOfflineState createState() => _GamePageOfflineState();
}
class _GamePageOfflineState extends State<GamePageOffline> {

  var title, playerNameOne, playerNameTwo;
  var mode;

  @override
  void initState() {
    mode = GameMode.Offline;
    playerNameOne = "1";
    playerNameTwo = "2";
    super.initState();
  }

  @override
  void didChangeDependencies() {
    title = S.of(context).gameModeOffline;
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