import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class MainInfoTab extends StatelessWidget {
  const MainInfoTab({
    Key? key,
    required this.fieldTitle,
    required this.fieldInfo,
  }) : super(key: key);
  final String fieldTitle;
  final String fieldInfo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.width,
      height: 10.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.gray,
                fontWeight: FontWeight.w500,
                fontFamily: AppStrings.fontFamilyHind,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 0.3.height),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColor.black,
                fontWeight: FontWeight.w700,
                fontFamily: AppStrings.fontFamilyHind,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
