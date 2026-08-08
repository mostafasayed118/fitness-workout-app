import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class TitleSubtitleCell extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleSubtitleCell({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  static final borderRadius = BorderRadius.circular(15);
  static const boxShadow = [BoxShadow(color: Colors.black12, blurRadius: 2)];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: AppColor.primaryColor4,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: AppStrings.fontFamilyHind,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.01),
          Text(
            subtitle,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColor.gray,
              fontSize: 12,
              fontFamily: AppStrings.fontFamilyHind,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
