import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterotpfield/flutterotpfield.dart';
import 'package:get/get.dart';
import 'package:live_easy/constraint/my_color.dart';
import 'package:live_easy/constraint/my_images.dart';
import 'package:live_easy/constraint/my_strings.dart';

import '../../../core/route/route.dart';
import '../../../data/controller/send_otp_controller.dart';

class VerifyOtp extends StatefulWidget {
  final String? phoneNumber;

  const VerifyOtp({super.key, required this.phoneNumber});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendOTPController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        body: Stack(children: [
          Container(
            color: MyColor.whiteColor,
          ),
          Positioned.fill(
              child: SingleChildScrollView(
                  child: Column(children: [
            Row(children: [
              const SizedBox(height: 80, width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(MyImages.icLeftArrow, width: 30, height: 30),
              )
            ]),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    MyStrings.titleVerifyOTP,
                    style: TextStyle(
                        color: MyColor.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Text('${MyStrings.subtitleVerifyOTP} ${widget.phoneNumber}', style: TextStyle(
                    color: MyColor.grayColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 25),
                  FlutterOtpField(
                    inputFieldLength: 6,
                    spaceBetweenFields: 10,

                    onValueChange: (String value) {
                      print("otp changed $value");
                    },
                    onCompleted: (String value) {
                      print("otp  $value");
                    },),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyStrings.receiveTitle,
                        style: TextStyle(
                            color: MyColor.grayColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        MyStrings.receiveSubtitle,
                        style: TextStyle(
                            color: MyColor.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteHelper.selectProfile);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 20),
                              backgroundColor: MyColor.btnColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text(
                            'VERIFY AND CONTINUE',
                            style: TextStyle(
                                color: MyColor.whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )),
                    )
                ],
              ),
            )
          ])))
        ]),
        bottomNavigationBar: Container(
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
