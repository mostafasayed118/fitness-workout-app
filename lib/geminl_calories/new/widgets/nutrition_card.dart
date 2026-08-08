import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';

class NutritionCardNew extends StatelessWidget {
  final String title;
  final String description;
  final String? sugar;
  final String? protein;
  final String? fibers;
  final String? fats;

  const NutritionCardNew({
    super.key,
    required this.title,
    required this.description,
    this.sugar,
    this.protein,
    this.fibers,
    this.fats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: AppColor.backgroundColor,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
                fontFamily: AppStrings.fontFamilyHind,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
