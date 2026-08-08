import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';

// Custom input field widget
class CustomInputFieldMeal extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData iconData;
  final TextInputType keyboardType;

  const CustomInputFieldMeal({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    required this.iconData,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: AppColor.primaryColor4,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(width: 1.0, color: AppColor.primaryColor1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(width: 1.0, color: AppColor.primaryColor4),
          ),
          prefixIcon: Container(
            alignment: Alignment.center,
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            child: Icon(iconData, color: AppColor.primaryColor4),
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: AppColor.primaryColor1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: AppStrings.fontFamilyPoppins,
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(width: 1.0, color: AppColor.primaryColor1),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
