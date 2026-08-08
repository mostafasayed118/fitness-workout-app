import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class TodayTargetCell extends StatelessWidget {
  final String icon;
  final String value;
  final String title;
  const TodayTargetCell({
    Key? key,
    required this.icon,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      height: isSmallScreen ? 120 : 70,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: isSmallScreen ? 80 : 40,
            height: isSmallScreen ? 80 : 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: AppColor.primaryColor4,
                    fontWeight: FontWeight.w600,
                    fontSize: isSmallScreen ? 20 : 16,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: isSmallScreen ? 16 : 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
