import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:live_easy/core/route/route.dart';
import 'package:live_easy/data/controller/social_signIn_controller.dart';
import 'package:live_easy/data/repository/social_signIn_repo.dart';

import '../../constraint/my_color.dart';
import '../../constraint/my_images.dart';
import '../../constraint/my_strings.dart';

class SocialSignInScreen extends StatefulWidget {
  const SocialSignInScreen({super.key});

  @override
  State<SocialSignInScreen> createState() => _SocialSignInScreenState();
}

class _SocialSignInScreenState extends State<SocialSignInScreen> {
  @override
  void initState() {
    Get.put(SocialSignINRepository());
    Get.put(SocialSignInController(socialSignINRepo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return GetBuilder<SocialSignInController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              color: MyColor.whiteColor,
            ),
            Positioned.fill(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(children: [
                    const SizedBox(height: 80, width: 15),
                    IconButton(
                      icon: SvgPicture.asset(
                        MyImages.icCencel,
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    )
                  ]),
                  Center(
                    child: Column(children: [
                      const SizedBox(height: 100),
                      Text(
                        MyStrings.titleEmail,
                        style: TextStyle(
                            color: MyColor.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 17.0),
                          child: Column(
                            children: [
                              Obx(() => TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.email_outlined),
                                      labelText: 'Please Enter Email',
                                      border: const OutlineInputBorder(),
                                      errorText:
                                          controller.emailError.isNotEmpty
                                              ? controller.emailError.value
                                              : null,
                                    ),
                                    onChanged: (value) {
                                      controller.email.value = value;
                                      controller.validateEmail(value);
                                    },
                                  )),
                              const SizedBox(height: 24),
                              Obx(() => TextField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.email_outlined),
                                      labelText: 'Please Enter password',
                                      border: const OutlineInputBorder(),
                                      errorText:
                                          controller.passwordError.isNotEmpty
                                              ? controller.passwordError.value
                                              : null,
                                    ),
                                    onChanged: (value) {
                                      controller.password.value = value;
                                      controller.validatePassword(value);
                                    },
                                  )),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            const Text(
                              'Forget your password?',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(RouteHelper.resetPassword);
                                },
                                child: const Text('Reset Here',
                                    style:
                                        TextStyle(color: Colors.blueAccent))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Obx(() {
                        return controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : Padding(
                                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    color: controller.isButtonEnabled.value
                                        ? MyColor.btnColor
                                        : MyColor.disableBtnColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final email =
                                          _emailController.text.trim();
                                      final password =
                                          _passwordController.text.trim();
                                      controller.isButtonEnabled.value
                                          ? await controller
                                              .handleAuthWithEmail(
                                                  email, password)
                                          : null;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 125, vertical: 18),
                                      minimumSize: Size(
                                          double.infinity,
                                          MediaQuery.of(context).size.height *
                                              0.06),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: const Text(
                                      'CONTINUE',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                      }),
                    ]),
                  ),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: Container(
          height: 154,
          child: SvgPicture.asset(
            MyImages.bgMobile,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ));
    });
  }
}
