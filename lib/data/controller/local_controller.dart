import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:live_easy/core/route/route.dart';

class LocalizationController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      Get.offAndToNamed(RouteHelper.selectProfile);
    } else {
      Get.offAndToNamed(RouteHelper.languageScreen);
    }
  }
}