import 'package:flutter/material.dart';
import 'package:roshambo/config/constants.dart';
import 'package:roshambo/generated/l10n.dart';
import 'package:roshambo/pages/base_game.dart';

class GamePageLocal extends StatefulWidget {

  @override
  _GamePageLocalState createState() => _GamePageLocalState();
}
class _GamePageLocalState extends State<GamePageLocal> {

  var title, playerNameOne, playerNameTwo;
  var mode;

  @override
  void didChangeDependencies() {
    title = S.of(context).gameModeLocal;
    mode = GameMode.Local;
    playerNameOne = S.of(context).playerNameOne;
    playerNameTwo = S.of(context).playerNameTwo;
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