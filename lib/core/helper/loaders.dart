import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: duration),
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: Colors.white),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning, color: Colors.white),
    );
  }

  static errorSnackNar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }
}
