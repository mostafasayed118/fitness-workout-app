import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab({
    Key? key,
    required this.fieldTitle,
    required this.fieldInfo,
  }) : super(key: key);
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.height),
            child: Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.primaryColor4,
                fontWeight: FontWeight.w500,
                fontFamily: AppStrings.fontFamilyHind,
                fontSize: 12.sp,
              ),
            ),
          ),
          Text(
            fieldInfo,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColor.primaryColor1,
              fontWeight: FontWeight.w700,
              fontFamily: AppStrings.fontFamilyHind,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
