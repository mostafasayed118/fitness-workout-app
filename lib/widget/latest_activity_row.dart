import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class LatestActivityRow extends StatelessWidget {
  final Map wObj;
  const LatestActivityRow({Key? key, required this.wObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final double imageSize = isSmallScreen ? 40 : 50;
    final double titleFontSize = isSmallScreen ? 12 : 14;
    final double timeFontSize = isSmallScreen ? 10 : 12;
    final double iconSize = isSmallScreen ? 10 : 12;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              wObj["image"].toString(),
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wObj["title"].toString(),
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
                Text(
                  wObj["time"].toString(),
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: timeFontSize,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAssets.threeDotsVerticalIcon,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
