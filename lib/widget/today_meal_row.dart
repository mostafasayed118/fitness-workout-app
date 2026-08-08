import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';
import '../core/utils/app_colors.dart';

class TodayMealRow extends StatefulWidget {
  final Map mObj;
  const TodayMealRow({Key? key, required this.mObj}) : super(key: key);

  @override
  State<TodayMealRow> createState() => _TodayMealRowState();
}

class _TodayMealRowState extends State<TodayMealRow> {
  bool isNotificationOn = false;
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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              widget.mObj["image"].toString(),
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
                  widget.mObj["name"].toString(),
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${getDayTitle(widget.mObj["time"].toString())} | ${getStringDateToOtherFormate(widget.mObj["time"].toString(), outFormatStr: "h:mm aa")}",
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: isSmallScreen ? 10 : 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isNotificationOn = !isNotificationOn;
              });
            },
            icon: isNotificationOn
                ? Image.asset(
                    AppAssets.remindersOnIcon,
                    width: isSmallScreen ? 25 : 30,
                    height: isSmallScreen ? 25 : 30,
                  )
                : Image.asset(
                    AppAssets.remindersOffIcon,
                    width: isSmallScreen ? 25 : 30,
                    height: isSmallScreen ? 25 : 30,
                  ),
          ),
        ],
      ),
    );
  }
}
