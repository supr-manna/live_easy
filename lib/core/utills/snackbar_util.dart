import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_easy/constraint/my_color.dart';

void showCustomSnackBar(String message, {bool isError = false}) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: isError ? Colors.red : Colors.green,
    colorText: MyColor.whiteColor,
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
    borderRadius: 8.0,
    duration: const Duration(seconds: 3),
    titleText: const SizedBox(), // Removes the extra space for title
    messageText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          isError ? Icons.error : Icons.check_circle,
          color: MyColor.whiteColor,
          size: 20.0,
        ),
        const SizedBox(width: 8.0), // Space between icon and text
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              color: MyColor.whiteColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ),
  );
}
