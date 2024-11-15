import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:live_easy/data/repository/social_signIn_repo.dart';

import '../../core/utills/snackbar_util.dart';

class ResetPasswordController extends GetxController {
  final SocialSignINRepository resetRepo;

  var isLoading = false.obs;
  var emailError = ''.obs;
  var email = ''.obs;
  RxBool isButtonEnabled = false.obs;

  ResetPasswordController({required this.resetRepo});

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

  void updateButtonState() {
    isButtonEnabled.value = email.value.isNotEmpty &&
        emailError.value.isEmpty;
  }

  Future<void> sendResetLink() async {
    isLoading.value = true;

    try {
      await resetRepo.sendResetLink(email.value);
      showCustomSnackBar('Password reset email sent', isError: false);

    } on FirebaseAuthException catch (e) {
      showCustomSnackBar(e.message ?? 'An unknown error occurred', isError: true);
    } finally {
      isLoading.value = false;
    }
  }
}