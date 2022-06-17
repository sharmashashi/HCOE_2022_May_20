import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEmailPasswordAuthentication {
  static Future<void> createAccount(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  static Future<void> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
