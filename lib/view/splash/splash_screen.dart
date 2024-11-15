import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_easy/constraint/my_images.dart';
import 'package:live_easy/data/controller/local_controller.dart';

import '../../constraint/my_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final controller = LocalizationController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: MyColor.transparentColor,
          statusBarColor: MyColor.transparentColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light));
      controller.checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColor.whiteColor,
      body: Center(
        child: Image.asset(MyImages.logo,
            height: 130, width: 130, fit: BoxFit.cover),
      ),
    ));
  }
}
