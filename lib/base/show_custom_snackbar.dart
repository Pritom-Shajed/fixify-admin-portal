import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message,
    {bool isError = true, title = 'Error'}) {
  Get.snackbar(title, message,
      titleText: MediumText(
        textAlign: TextAlign.start,
        text: title,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      colorText: AppColors.whiteColor,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.primaryColor);
}
