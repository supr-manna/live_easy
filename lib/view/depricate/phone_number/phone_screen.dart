import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:live_easy/constraint/my_color.dart';
import 'package:live_easy/constraint/my_images.dart';
import 'package:live_easy/constraint/my_strings.dart';
import '../../../core/route/route.dart';
import '../../../data/controller/send_otp_controller.dart';
import '../../../data/repository/send_otp_repository.dart';
import 'widget/country_code_picker_field.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  void initState() {
    Get.put(SendOTPRepository(mAuth: FirebaseAuth.instance));
    Get.put(SendOTPController(sendOTPRepo: Get.find()));
    super.initState();
  }

  String phoneNumber = '';
  String countryCode = '';
  bool isButtonEnabled = false;

  /// Function to validate phone number input
  void _onPhoneNumberChanged(String value, String number) {
    setState(() {
      countryCode = value.trim();
      phoneNumber = number.trim();
      isButtonEnabled = phoneNumber.isNotEmpty && phoneNumber.length == 10;
      if (isButtonEnabled) {
        Get.find<SendOTPController>().phone = '$countryCode$phoneNumber';
      }
    });
  }

  /// After OTP success fully send redirect to OTP verify screen.
  void _sendOTP() {
    Get.find<SendOTPController>().sendOTP((verificationId) {
      Get.toNamed(RouteHelper.verifyOTP, arguments: '$countryCode$phoneNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendOTPController>(builder: (controller) {
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(MyImages.icCencel,
                          width: 30, height: 30),
                    )
                  ]),
                  Center(
                    child: Column(children: [
                      const SizedBox(height: 100),
                      Text(
                        MyStrings.title,
                        style: TextStyle(
                            color: MyColor.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        MyStrings.subtitle,
                        style: TextStyle(
                            color: MyColor.grayColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 34),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 17.0),
                        child: CountryCodePickerTextField(
                          onPhoneNumberChanged: _onPhoneNumberChanged,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                          onPressed: _sendOTP,
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 125, vertical: 18),
                              backgroundColor: MyColor.btnColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text(
                            'CONTINUE',
                            style: TextStyle(
                                color: MyColor.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ))
                    ]),
                  ),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 154,
          child: SvgPicture.asset(
            MyImages.bgMobile, // Replace with your image path
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ));
    });
  }
}
