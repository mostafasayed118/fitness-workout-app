import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

Widget buildKeyPointText(String title, String subTitle) {
  return SingleChildScrollView(
    child: Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColor.primaryColor1,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: AppStrings.fontFamilyHind,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: TextStyle(
              color: AppColor.primaryColor4,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: AppStrings.fontFamilyHind,
            ),
          ),
        ],
      ),
    ),
  );
}
