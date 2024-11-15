import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:live_easy/constraint/my_color.dart';
import 'package:live_easy/constraint/my_images.dart';
import 'package:live_easy/constraint/my_strings.dart';
import 'package:live_easy/core/models/my_languages.dart';
import 'package:live_easy/core/route/route.dart';
import 'package:live_easy/data/controller/local_controller.dart';

import '../../core/utills/snackbar_util.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  MyLanguages? selectedItem;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: MyColor.whiteColor,
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  SvgPicture.asset(MyImages.icGallery, width: 90, height: 90),
                  const SizedBox(height: 32),
                  Text(
                    MyStrings.selectPhone,
                    style: TextStyle(
                        color: MyColor.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(MyStrings.languageSubtitle,
                      style: TextStyle(
                          color: MyColor.grayColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                    child: DropdownButtonFormField<MyLanguages>(
                        hint: const Text('Please select language'),
                        value: selectedItem,
                        icon: const Icon(Icons.arrow_drop_down),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (MyLanguages? newValue) {
                          setState(() {
                            selectedItem = newValue;
                          });
                        },
                        items:
                            MyStrings.myLanguages.map((MyLanguages language) {
                          return DropdownMenuItem<MyLanguages>(
                              value: language,
                              child: Text(language.languageName ?? 'English'));
                        }).toList()),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (selectedItem == null) {
                          showCustomSnackBar('Please select a language', isError: true);
                        } else {
                          Get.toNamed(RouteHelper.socialSignIn);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 18),
                          backgroundColor: MyColor.btnColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text('Next',
                        style: TextStyle(
                            color: MyColor.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                MyImages.bgLanguage,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 154,
              ),
            )
          ],
        ),
      ));
    });
  }
}
