import 'package:flutter/material.dart';
import 'package:roshambo/config/constants.dart';
import 'package:roshambo/generated/l10n.dart';
import 'package:roshambo/pages/base_game.dart';

class GamePageMulti extends StatefulWidget {

  @override
  _GamePageMultiState createState() => _GamePageMultiState();
}
class _GamePageMultiState extends State<GamePageMulti> {

  var title, playerNameOne, playerNameTwo;
  var mode;

  @override
  void didChangeDependencies() {
    title = S.of(context).gameModeMulti;
    mode = GameMode.Multi;
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