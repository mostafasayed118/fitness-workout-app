// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String hitText;
  final String iconPath;
  final EdgeInsets? margin;
  final Widget? rightIcon;
  final bool obscureText;
  final int? maxLines;
  final Function(String)? onChanged;

  void Function()? onTap;

  RoundTextfield({
    Key? key,
    this.controller,
    this.validator,
    this.keyboardType,
    required this.hitText,
    required this.iconPath,
    this.margin,
    this.rightIcon,
    this.obscureText = false,
    this.maxLines,
    this.onChanged,
    this.onTap,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.07,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColor.gray.withOpacity(0.05),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: TextFormField(
        maxLength: maxLength,
        onTap: onTap,
        onChanged: onChanged,
        cursorColor: AppColor.primaryColor4,
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          counterStyle: TextStyle(
            fontFamily: AppStrings.fontFamilyHind,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor4,
            fontSize: screenWidth * 0.035,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),

          // EdgeInsets.only(
          //   left: screenWidth * 0.05,
          //   right: screenWidth * 0.05,
          //   top: screenHeight * 0.01,
          //   bottom: screenHeight * 0.01,
          // ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hitText,
          hintStyle: TextStyle(
            fontFamily: AppStrings.fontFamilyHind,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor1,
          ),
          suffixIcon: rightIcon,
          prefixIcon: Container(
            alignment: Alignment.center,
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            child: Image.asset(
              iconPath,
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
              fit: BoxFit.contain,
            ),
          ),
          helperStyle: TextStyle(
            color: AppColor.gray,
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.w500,
            fontFamily: AppStrings.fontFamilyHind,
          ),
        ),
      ),
    );
  }
}
