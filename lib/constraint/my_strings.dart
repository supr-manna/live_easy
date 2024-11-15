import 'package:live_easy/core/models/my_languages.dart';

import 'my_images.dart';

class MyStrings {
  static const String selectPhone = 'Please select your Language';
  static const String languageSubtitle = 'You can change the language at any time.';
  static const String title = 'Please enter your mobile number';
  static const String titleEmail = 'Please enter your Email-Id ';
  static const String subtitle = 'You’ll receive a 6 digit code to verify next.';
  static const String resetSubtitle = 'An email with a reset link will be sent to you shortly.';
  static const String titleVerifyOTP = 'Verify Phone';
  static const String subtitleVerifyOTP = 'Code is sent to ';
  static const String receiveTitle = 'Didn’t receive the code? ';
  static const String receiveSubtitle = 'Request Again';
  static const String profileSelect = 'Please select your profile';


  static List<MyLanguages> myLanguages = [
    MyLanguages(languageName: 'English', countryCode: 'US', languageCode: 'en'),
    MyLanguages(languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];

  static List<Map<String, dynamic>> profiles = [
    {
      'icon': MyImages.icShipper,
      'title': 'Shipper',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing'
    },
    {
      'icon': MyImages.icTransporter,
      'title': 'Transporter',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing'
    }
  ];
}