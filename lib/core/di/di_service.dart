import 'package:get/get.dart';
import '../../data/controller/local_controller.dart';

Future<Map<String, Map<String, String>>> init() async {
  //Get.lazyPut(() => SplashRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocalizationController());
  //Get.lazyPut(() => SplashController(localizationController: Get.find(), sharedPreferences: Get.find()));

  Map<String, Map<String, String>> language = {};
  language['en_US'] = {'': ''};
  return language;
}
