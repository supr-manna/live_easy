import 'package:firebase_auth/firebase_auth.dart';

class SendOTPRepository {
  final FirebaseAuth mAuth;

  SendOTPRepository({required this.mAuth});

  Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String) codeSent) async {
    await mAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await mAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException ex) {},
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {}
    );
  }
}