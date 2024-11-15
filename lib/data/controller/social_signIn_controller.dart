import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:live_easy/data/repository/social_signIn_repo.dart';

import '../../core/route/route.dart';
import '../../core/utills/snackbar_util.dart';

class SocialSignInController extends GetxController {
  final SocialSignINRepository socialSignINRepo;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var emailError = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var passwordError = ''.obs;
  RxBool isButtonEnabled = false.obs;

  SocialSignInController({required this.socialSignINRepo});

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = "Email cannot be empty";
      return;
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      emailError.value = "Enter a valid email";
      return;
    }
    emailError.value = '';
    updateButtonState();
  }

  void validatePassword(String password) {
    passwordError.value = '';

    if (password.isEmpty) {
      passwordError.value = "Password is required";
      return;
    }

    if (password.length < 6) {
      passwordError.value = "Password must be at least 6 characters long";
      return;
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      passwordError.value =
          "Password must contain at least one uppercase letter";
      return;
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      passwordError.value =
          "Password must contain at least one lowercase letter";
      return;
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      passwordError.value = "Password must contain at least one digit";
      return;
    }

    if (!RegExp(r'[!@#\$&*~]').hasMatch(password)) {
      passwordError.value =
          "Password must contain at least one special character";
      return;
    }
    passwordError.value = '';
    updateButtonState();
  }

  void updateButtonState() {
    isButtonEnabled.value = email.value.isNotEmpty &&
        emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        password.value.isNotEmpty;
  }

  Future<void> handleAuthWithEmail(String email, String password) async {
    isLoading.value = true;

    try {
      await socialSignINRepo.registerWithEmail(email, password);
      showCustomSnackBar('Account created successfully', isError: false);
      Get.toNamed(RouteHelper.selectProfile);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        try {
          await socialSignINRepo.signInWithEmail(email, password);
          showCustomSnackBar('Signed in successfully', isError: false);
          Get.toNamed(RouteHelper.selectProfile);
        } on FirebaseAuthException catch (signInError) {
          if (signInError.code == 'wrong-password') {
            showCustomSnackBar('Incorrect password. Try again.', isError: true);
          } else {
            showCustomSnackBar(signInError.message ?? 'An error occurred',
                isError: true);
          }
        }
      } else if (e.code == 'invalid-email') {
        showCustomSnackBar('The email address is badly formatted.',
            isError: true);
      } else if (e.code == 'weak-password') {
        showCustomSnackBar('The password is too weak.', isError: true);
      } else {
        showCustomSnackBar(e.message ?? 'An error occurred', isError: true);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
