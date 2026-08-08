import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class SettingRow extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;

  const SettingRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: isSmallScreen ? 50 : 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: isSmallScreen ? 30 : 15,
              width: isSmallScreen ? 30 : 15,
              fit: BoxFit.contain,
            ),
            SizedBox(width: isSmallScreen ? 20 : 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: isSmallScreen ? 16 : 12,
                  fontFamily: AppStrings.fontFamilyHind,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Image.asset(
              AppAssets.rightArrowNormalIcon,
              height: isSmallScreen ? 36 : 18,
              width: isSmallScreen ? 36 : 18,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
