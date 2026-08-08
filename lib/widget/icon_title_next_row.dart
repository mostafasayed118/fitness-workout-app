import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class IconTitleNextRow extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  final VoidCallback onPressed;
  final Color color;
  const IconTitleNextRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.time,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: isSmallScreen ? 25 : 30,
              height: isSmallScreen ? 25 : 30,
              alignment: Alignment.center,
              child: Image.asset(
                icon,
                width: isSmallScreen ? 12 : 18,
                height: isSmallScreen ? 12 : 18,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: isSmallScreen ? 11 : 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.fontFamilyHind,
                ),
              ),
            ),
            SizedBox(
              width: isSmallScreen ? 80 : 120,
              child: Text(
                time,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: isSmallScreen ? 10 : 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.fontFamilyHind,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: isSmallScreen ? 20 : 25,
              height: isSmallScreen ? 20 : 25,
              child: Container(
                width: isSmallScreen ? 20 : 25,
                height: isSmallScreen ? 20 : 25,
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.rightArrowBlackIcon,
                  width: isSmallScreen ? 10 : 12,
                  height: isSmallScreen ? 10 : 12,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
