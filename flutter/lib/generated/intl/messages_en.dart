// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(name) => "player ${name}";

  static m1(name, choice) => "player ${name} had selected ${choice}";

  static m2(name) => "player ${name} has won!";

  static m3(name, count) => "player ${name}: ${count}";

  static m4(count) => "tie: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "currentGamePlayer" : m0,
    "gameActionExit" : MessageLookupByLibrary.simpleMessage("Exit Game"),
    "gameActionNew" : MessageLookupByLibrary.simpleMessage("New Game"),
    "gameChoicePaper" : MessageLookupByLibrary.simpleMessage("Paper"),
    "gameChoiceRock" : MessageLookupByLibrary.simpleMessage("Rock"),
    "gameChoiceScissors" : MessageLookupByLibrary.simpleMessage("Scissors"),
    "gameModeLocal" : MessageLookupByLibrary.simpleMessage("Local: offline"),
    "gameModeMulti" : MessageLookupByLibrary.simpleMessage("multi-player"),
    "gameOverActionRestart" : MessageLookupByLibrary.simpleMessage("Restart Game"),
    "gameOverMessageTie" : MessageLookupByLibrary.simpleMessage("players have tied!"),
    "gameOverTitle" : MessageLookupByLibrary.simpleMessage("Game Over!"),
    "gamePlayerSelected" : m1,
    "gamePlayerWon" : m2,
    "leaderBoardPlayer" : m3,
    "leaderBoardPlayerTie" : m4,
    "playerNameOne" : MessageLookupByLibrary.simpleMessage("One"),
    "playerNameTwo" : MessageLookupByLibrary.simpleMessage("Two"),
    "title" : MessageLookupByLibrary.simpleMessage("RoShamBo")
  };
}
