import 'package:firebase_auth/firebase_auth.dart';

class SendOTPRepository {
  final FirebaseAuth mAuth;

  SendOTPRepository({required this.mAuth});

  Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String) codeSent) async {
    print('PhoneNumber: $phoneNumber');
    await mAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await mAuth.signInWithCredential(credential);
          print('Phone number verified and signIn automatically');
        },
        verificationFailed: (FirebaseAuthException ex) {
          print('Phone verification failed ${ex.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('TimeOut');
        }
    );
  }
}