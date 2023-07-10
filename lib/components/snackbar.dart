import 'package:codeit/res/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/routes.dart';

class AppSnackBar {
  defaultSnackBar(String title, String msg, String? buttonText) => GetSnackBar(
        backgroundColor: Colors.black,
        titleText: Text(
          title,
          style: ProjectTextStyles.body,
        ),
        mainButton: getButton(buttonText),
        messageText: Text(msg, style: ProjectTextStyles.body),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        isDismissible: true,
      );

  Widget? getButton(String? text) {
    if (text == null) return null;
    return TextButton(
      child: const Text(
        'go back',
        style: ProjectTextStyles.snackButton,
      ),
      onPressed: () {
        Get.toNamed(Routes.signup);
      },
    );
  }
}
