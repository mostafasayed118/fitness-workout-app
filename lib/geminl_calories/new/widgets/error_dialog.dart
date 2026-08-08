import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialogNew extends StatelessWidget {
  final String message;

  const ErrorDialogNew({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
