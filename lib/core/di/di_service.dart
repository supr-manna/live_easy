import 'package:get/get.dart';
import '../../data/controller/local_controller.dart';

Future<Map<String, Map<String, String>>> init() async {
  Get.lazyPut(() => LocalizationController());
  Map<String, Map<String, String>> language = {};
  language['en_US'] = {'': ''};
  return language;
}
