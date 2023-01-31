import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showCustomSnackBar(String message, String title) {
  Get.snackbar(

      title,
      message,
      animationDuration: Duration(seconds: 1),
      titleText: Text(title),
      messageText: Text(
        message,
      ),
      duration: Duration(seconds: 2));
}
