import 'package:firebase_auth/firebase_auth.dart';

class SocialSignINRepository {
  final FirebaseAuth mAuth = FirebaseAuth.instance;

  Future<UserCredential?> registerWithEmail(String email, String password) async {
    return await mAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    return await mAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> sendResetLink(String email) async {
    FirebaseAuth.instance.setLanguageCode('en');
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

}
