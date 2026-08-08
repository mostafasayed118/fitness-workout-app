import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class StepDetailRow extends StatelessWidget {
  final Map sObj;
  final bool isLast;
  const StepDetailRow({Key? key, required this.sObj, this.isLast = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isSmallScreen ? 20 : 25,
          child: Text(
            sObj["no"].toString(),
            style: TextStyle(
              color: AppColor.primaryColor1,
              fontSize: isSmallScreen ? 14 : 16,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: isSmallScreen ? 16 : 20,
              height: isSmallScreen ? 16 : 20,
              decoration: BoxDecoration(
                color: AppColor.primaryColor1,
                borderRadius: BorderRadius.circular(isSmallScreen ? 8 : 10),
              ),
              alignment: Alignment.center,
              child: Container(
                width: isSmallScreen ? 14 : 18,
                height: isSmallScreen ? 14 : 18,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.white, width: 2),
                  borderRadius: BorderRadius.circular(isSmallScreen ? 7 : 9),
                ),
              ),
            ),
            if (!isLast)
              DottedDashedLine(
                height: isSmallScreen ? 60 : 80,
                width: 0,
                dashColor: AppColor.primaryColor1,
                axis: Axis.vertical,
              ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sObj["title"].toString(),
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: isSmallScreen ? 14 : 16,
                  fontFamily: AppStrings.fontFamilyPoppins,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                sObj["detail"].toString(),
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: isSmallScreen ? 11 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
