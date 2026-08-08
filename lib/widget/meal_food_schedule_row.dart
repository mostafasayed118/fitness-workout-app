import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class MealFoodScheduleRow extends StatelessWidget {
  final Map mObj;
  final int index;
  const MealFoodScheduleRow({Key? key, required this.mObj, required this.index})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isEvenIndex = index % 2 == 0;
    final Color backgroundColor = isEvenIndex
        ? AppColor.primaryColor4.withOpacity(0.16)
        : AppColor.primaryColor8.withOpacity(0.25);

    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageContainerSize = screenWidth * 0.1;
    final double imageSize = imageContainerSize * 0.8;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: imageContainerSize,
              width: imageContainerSize,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                mObj["image"].toString(),
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mObj["name"].toString(),
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
                Text(
                  mObj["time"].toString(),
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAssets.rightArrowGradinNormalIcon,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
