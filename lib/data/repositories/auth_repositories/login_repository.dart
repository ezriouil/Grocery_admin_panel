import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  LoginRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES - - - - - - - - - - - - - - - - - -  //
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> registerWithEmailAndPassword({required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential?> loginWithEmailAndPassword({required String email, required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

}
