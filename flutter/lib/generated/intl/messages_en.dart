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
    "authAccountSignIn" : MessageLookupByLibrary.simpleMessage("Have an Account? Sign in"),
    "authAccountSignUp" : MessageLookupByLibrary.simpleMessage("create an account? Sign up"),
    "authHintEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "authHintPassword" : MessageLookupByLibrary.simpleMessage("Password"),
    "authSignIn" : MessageLookupByLibrary.simpleMessage("Sign In"),
    "authSignUp" : MessageLookupByLibrary.simpleMessage("Sign Up"),
    "currentGamePlayer" : m0,
    "gameActionCancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "gameActionExit" : MessageLookupByLibrary.simpleMessage("Exit Game"),
    "gameActionNew" : MessageLookupByLibrary.simpleMessage("New Game"),
    "gameActionRestart" : MessageLookupByLibrary.simpleMessage("Restart Game"),
    "gameChoicePaper" : MessageLookupByLibrary.simpleMessage("Paper"),
    "gameChoiceRock" : MessageLookupByLibrary.simpleMessage("Rock"),
    "gameChoiceScissors" : MessageLookupByLibrary.simpleMessage("Scissors"),
    "gameMessageWaiting" : MessageLookupByLibrary.simpleMessage("waiting for other player...."),
    "gameModeOffline" : MessageLookupByLibrary.simpleMessage("Offline"),
    "gameModeOnline" : MessageLookupByLibrary.simpleMessage("Online"),
    "gameOverMessageTie" : MessageLookupByLibrary.simpleMessage("players have tied!"),
    "gameOverTitle" : MessageLookupByLibrary.simpleMessage("Game Over!"),
    "gamePlayerSelected" : m1,
    "gamePlayerWon" : m2,
    "leaderBoardPlayer" : m3,
    "leaderBoardPlayerTie" : m4,
    "title" : MessageLookupByLibrary.simpleMessage("RoShamBo")
  };
}
