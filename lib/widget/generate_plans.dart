import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import 'normal_button.dart';

class PlanGeneratorWidget extends StatelessWidget {
  const PlanGeneratorWidget({
    Key? key,
    required this.titleText,
    required this.subTitleText,
    required this.onPressed,
  }) : super(key: key);

  final String titleText;
  final String subTitleText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final double smallScreenFontSize = isSmallScreen ? 14 : 16;
    final double smallScreenSecondaryFontSize = isSmallScreen ? 12 : 13;
    final double smallScreenButtonWidth = isSmallScreen ? 100 : 110;
    final double smallScreenButtonHeight = isSmallScreen ? 25 : 35;
    final double smallScreenImageSize = isSmallScreen ? 70 : 90;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.primaryColor1.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: smallScreenFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppStrings.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subTitleText,
                    style: TextStyle(
                      color: AppColor.gray.withOpacity(0.8),
                      fontSize: smallScreenSecondaryFontSize,
                      fontFamily: AppStrings.fontFamilyHind,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: smallScreenButtonWidth,
                    height: smallScreenButtonHeight,
                    child: NormalButton(
                      textColor: AppColor.primaryColor1,
                      text: 'Generate',
                      onPressed: onPressed,
                      backgroundColor: AppColor.white,
                      widthSize: smallScreenButtonWidth,
                      heightSize: smallScreenButtonHeight,
                      borderColor: AppColor.primaryColor1,
                      fontSize: smallScreenSecondaryFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
