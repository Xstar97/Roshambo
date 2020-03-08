import 'package:flutter/material.dart';
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
      return _image(Assets.choiceRock);
    case GameChoices.Paper:
      return _image(Assets.choicePaper);
    case GameChoices.Scissors:
      return _image(Assets.choiceScissors);
    default:
      return _image(Assets.choiceHands);
  }
}

Widget _image(String name){
  return Image(image: AssetImage(name), width: 100, height: 100,);
}

enum GameMode{
  Local,
  Multi
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