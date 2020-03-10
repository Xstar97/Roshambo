import 'package:flutter/material.dart';
import 'package:roshambo/config/Utils.dart';
import 'package:roshambo/config/assets.dart';
import 'package:roshambo/generated/l10n.dart';

class Constants
{
  static const PROFILE_FACEBOOK = 'https://www.facebook.com/xstar97';
  static const PROFILE_GITHUB = 'https://github.com/Xstar97';
  static const PROFILE_TWITTER = 'https://twitter.com/xstar97';
}

enum GameChoices {
  Rock,
  Paper,
  Scissors,
}

var gameChoices = [GameChoices.Rock, GameChoices.Paper,GameChoices.Scissors];

gameChoicesToString(BuildContext context, GameChoices choices){
  switch (choices) {
    case GameChoices.Rock:
      return S.of(context).gameChoiceRock;
    case GameChoices.Paper:
      return S.of(context).gameChoicePaper;
    case GameChoices.Scissors:
      return S.of(context).gameChoiceScissors;
    default:
      return "";
  }
}
gameChoicesToImages(BuildContext context, GameChoices choices){
  switch (choices) {
    case GameChoices.Rock:
      return _choiceImage(Assets.choiceRock);
    case GameChoices.Paper:
      return _choiceImage(Assets.choicePaper);
    case GameChoices.Scissors:
      return _choiceImage(Assets.choiceScissors);
    default:
      return _choiceImage(Assets.choiceHands);
  }
}

Widget _choiceImage(String name){
  return Utils().assetImage(name, 125);
}

enum GameMode{
  Online,
  Offline
}
enum FormMode {
  AUTH_LOGIN,
  AUTH_SIGN_UP
}

enum AuthStatus {
  AUTH_NOT_DETERMINED,
  AUTH_NOT_LOGGED_IN,
  AUTH_LOGGED_IN,
}