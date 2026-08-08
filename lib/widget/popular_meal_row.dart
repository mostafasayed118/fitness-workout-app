import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class PopularMealRow extends StatelessWidget {
  final Map mObj;
  const PopularMealRow({Key? key, required this.mObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Row(
        children: [
          Image.asset(
            mObj["image"].toString(),
            width: isSmallScreen ? 40 : 50,
            height: isSmallScreen ? 40 : 50,
            fit: BoxFit.contain,
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
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${mObj["size"]} | ${mObj["time"]} | ${mObj["kcal"]}",
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: isSmallScreen ? 11 : 13,
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
              width: isSmallScreen ? 20 : 25,
              height: isSmallScreen ? 20 : 25,
            ),
          ),
        ],
      ),
    );
  }
}
