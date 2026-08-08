import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/workout_tracker/workout_detail_view.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import 'normal_button.dart';

class WhatTrainRow extends StatelessWidget {
  final Map wObj;
  const WhatTrainRow({Key? key, required this.wObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final double smallScreenFontSize = isSmallScreen ? 12 : 15;
    final double smallScreenSecondaryFontSize = isSmallScreen ? 11 : 13;
    final double smallScreenButtonWidth = isSmallScreen ? 90 : 90;
    final double smallScreenButtonHeight = isSmallScreen ? 25 : 35;
    final double smallScreenImageSize = isSmallScreen ? 70 : 90;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.primaryColor4.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wObj["title"].toString(),
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: smallScreenFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppStrings.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${wObj["exercises"]} | ${wObj["time"]} ",
                    style: TextStyle(
                      color: AppColor.gray.withOpacity(0.8),
                      fontSize: smallScreenSecondaryFontSize,
                      fontFamily: AppStrings.fontFamilyHind,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: smallScreenButtonWidth,
                    height: smallScreenButtonHeight,
                    child: NormalButton(
                      textColor: AppColor.primaryColor1,
                      text: AppStrings.viewMore,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WorkoutDetailView(dObj: wObj);
                            },
                          ),
                        );
                      },
                      backgroundColor: AppColor.white,
                      widthSize: smallScreenButtonWidth,
                      heightSize: smallScreenButtonHeight,
                      borderColor: AppColor.primaryColor1,
                      fontSize: smallScreenSecondaryFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                wObj["image"].toString(),
                width: smallScreenImageSize,
                height: smallScreenImageSize,

                // fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
