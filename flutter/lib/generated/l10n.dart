// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'RoShamBo',
      name: 'title',
      desc: 'Name of the app',
      args: [],
    );
  }

  String get playerNameOne {
    return Intl.message(
      'One',
      name: 'playerNameOne',
      desc: 'player name',
      args: [],
    );
  }

  String get playerNameTwo {
    return Intl.message(
      'Two',
      name: 'playerNameTwo',
      desc: 'player name',
      args: [],
    );
  }

  String get gameChoiceRock {
    return Intl.message(
      'Rock',
      name: 'gameChoiceRock',
      desc: 'game choice; stone',
      args: [],
    );
  }

  String get gameChoicePaper {
    return Intl.message(
      'Paper',
      name: 'gameChoicePaper',
      desc: 'game choice; letter',
      args: [],
    );
  }

  String get gameChoiceScissors {
    return Intl.message(
      'Scissors',
      name: 'gameChoiceScissors',
      desc: 'game choice; cutters',
      args: [],
    );
  }

  String get gameOverTitle {
    return Intl.message(
      'Game Over!',
      name: 'gameOverTitle',
      desc: 'game ended',
      args: [],
    );
  }

  String get gameOverMessageTie {
    return Intl.message(
      'players have tied!',
      name: 'gameOverMessageTie',
      desc: 'game ended in a tie',
      args: [],
    );
  }

  String get gameOverActionRestart {
    return Intl.message(
      'Restart Game',
      name: 'gameOverActionRestart',
      desc: 'game will restart',
      args: [],
    );
  }

  String gamePlayerSelected(dynamic name, dynamic choice) {
    return Intl.message(
      'player $name had selected $choice',
      name: 'gamePlayerSelected',
      desc: 'player had selected an option',
      args: [name, choice],
    );
  }

  String gamePlayerWon(dynamic name) {
    return Intl.message(
      'player $name has won!',
      name: 'gamePlayerWon',
      desc: 'player has won',
      args: [name],
    );
  }

  String currentGamePlayer(dynamic name) {
    return Intl.message(
      'player $name',
      name: 'currentGamePlayer',
      desc: 'current player\'s turn',
      args: [name],
    );
  }

  String leaderBoardPlayer(dynamic name, dynamic count) {
    return Intl.message(
      'player $name: $count',
      name: 'leaderBoardPlayer',
      desc: 'current player\'s winning count',
      args: [name, count],
    );
  }

  String leaderBoardPlayerTie(dynamic count) {
    return Intl.message(
      'tie: $count',
      name: 'leaderBoardPlayerTie',
      desc: 'tie count',
      args: [count],
    );
  }

  String get gameModeMulti {
    return Intl.message(
      'multi-player',
      name: 'gameModeMulti',
      desc: 'start a game online',
      args: [],
    );
  }

  String get gameModeLocal {
    return Intl.message(
      'Local: offline',
      name: 'gameModeLocal',
      desc: 'peer to peer game',
      args: [],
    );
  }

  String get gameActionExit {
    return Intl.message(
      'Exit Game',
      name: 'gameActionExit',
      desc: 'close game',
      args: [],
    );
  }

  String get gameActionNew {
    return Intl.message(
      'New Game',
      name: 'gameActionNew',
      desc: 'start new game',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}