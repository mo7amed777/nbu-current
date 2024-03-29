import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';

void showSnackBar({required String message, bool err = false}) {
  Get.showSnackbar(
    GetSnackBar(
      animationDuration: Duration(milliseconds: 500),
      backgroundGradient: LinearGradient(
        colors: err
            ? const [
                Colors.red,
                Colors.redAccent,
              ]
            : const [
                Color.fromARGB(255, 65, 128, 7),
                Color.fromARGB(255, 12, 143, 204),
              ],
      ),
      borderRadius: 25,
      dismissDirection: DismissDirection.horizontal,
      isDismissible: true,
      margin: EdgeInsets.all(16),
      messageText: Center(
        child: Text(
          message.tr,
          style: TextStyle(
            color: AppTheme.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
