import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({Key? key, required this.nObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              nObj["image"].toString(),
              width: isSmallScreen ? 30 : 40,
              height: isSmallScreen ? 30 : 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nObj["title"].toString(),
                  style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: isSmallScreen ? 12 : 14,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
                Text(
                  nObj["time"].toString(),
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: isSmallScreen ? 10 : 12,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              //Function more option will be here
            },
            icon: Image.asset(
              AppAssets.threeDotsVerticalIcon,
              width: isSmallScreen ? 12 : 15,
              height: isSmallScreen ? 12 : 15,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
