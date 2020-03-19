import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roshambo/config/firestore_delegate.dart';

class FireStoreRepository implements FireStoreRepoDelegate
{
  var db = Firestore.instance;

  var collectionGames = "games";
  var documentApp = "roshambo";
  //games
  //id
  var collectionUsers = "users";

  var fieldGameOver = "game_over";
  var fieldGamePlayerOneChoice = "game_player_one_choice";
  var fieldGamePlayerTwoChoice = "game_player_two_choice";
  var fieldGamePlayers = "game_players";
  var fieldGameWinner = "game_winner";

  var fieldUserId = "user_id";
  var fieldUserName = "user_name";
  var fieldUserCountLost = "user_lost_count";
  var fieldUserCountTie = "user_tie_count";
  var fieldUserCountWin = "user_win_count";


  @override
  CollectionReference getInitDB() {
    return db.collection(collectionGames);
  }

  @override
  void addGame(String id) {
    // TODO: implement addGame
  }

  @override
  void addUser(String id) {
    // TODO: implement addUser
  }

  @override
  Query getGameList() {
    // TODO: implement getGameList
    throw UnimplementedError();
  }

  @override
  Query getUserList() {
    // TODO: implement getUserList
    throw UnimplementedError();
  }

  @override
  void updateGame(String id) {
    // TODO: implement updateGame
  }

  @override
  void updateUser(String id) {
    // TODO: implement updateUser
  }

}