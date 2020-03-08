//import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDelegate {
  Future<String> signInEmail(String email, String password);

  Future<String> signUpEmail(String email, String password);

  //Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
