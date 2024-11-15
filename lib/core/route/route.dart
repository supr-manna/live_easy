import 'package:get/get.dart';
import 'package:live_easy/view/reset_password/reset_password.dart';
import 'package:live_easy/view/select_language/select_language_screen.dart';
import 'package:live_easy/view/setup_profile/select_profile.dart';
import 'package:live_easy/view/social_signin/social_signIn_screen.dart';
import 'package:live_easy/view/splash/splash_screen.dart';
import '../../view/depricate/phone_number/phone_screen.dart';
import '../../view/depricate/verify_otp/verify_otp.dart';

class RouteHelper {
  static const String splashScreen = '/splash_screen';
  static const String languageScreen = '/select_language_screen';
  static const String mobileScreen = '/mobile_screen';
  static const String verifyOTP = '/verify_otp_screen';
  static const String selectProfile = '/select_profile';
  static const String socialSignIn = '/social_signIn';
  static const String resetPassword = '/reset_password';

  static List<GetPage> route = [
    GetPage(name: splashScreen, page: ()=> const SplashScreen()),
    GetPage(name: languageScreen, page: ()=> const SelectLanguageScreen()),
    GetPage(name: mobileScreen, page: () => const PhoneScreen()),
    GetPage(name: verifyOTP, page: ()=> VerifyOtp(phoneNumber: Get.arguments)),
    GetPage(name: selectProfile, page: ()=> const SelectProfile()),
    GetPage(name: socialSignIn, page: ()=> const SocialSignInScreen()),
    GetPage(name: resetPassword, page: ()=> const ResetPassword()),
  ];
}