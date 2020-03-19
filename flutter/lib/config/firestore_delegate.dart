import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreRepoDelegate
{
  void addUser(String id){}
  void updateUser(String id){}
  void addGame(String id){}
  void updateGame(String id){}

  Query getGameList(){}
  Query getUserList(){}

  CollectionReference getInitDB(){}
}