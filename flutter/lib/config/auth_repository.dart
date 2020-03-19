import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:roshambo/config/auth_delegate.dart';

class Auth implements AuthDelegate {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  Future<String> signInEmail(String email, String password) async {
    FirebaseUser user = (await _fireBaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    )).user;
    return user.uid;
  }

  Future<String> signUpEmail(String email, String password) async {
    final FirebaseUser user = (await _fireBaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _fireBaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _fireBaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _fireBaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _fireBaseAuth.currentUser();
    return user.isEmailVerified;
  }

}