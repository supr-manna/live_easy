import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/route/route.dart';
import 'core/di/di_service.dart' as di_service;
import 'data/controller/local_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di_service.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (controller) {
      return GetMaterialApp(
        title: '',
        initialRoute: RouteHelper.splashScreen,
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500),
        getPages: RouteHelper.route,
        navigatorKey: Get.key,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
