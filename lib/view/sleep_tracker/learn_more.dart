import 'package:fitness_workout_app_1/core/helper/learn_more_text.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/sleep_tracker/sleep_tracker_view.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../main_tab/select_view.dart';

class LearnMoreSleep extends StatelessWidget {
  const LearnMoreSleep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SleepTrackerView();
                },
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              AppAssets.leftArrowIcon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          AppStrings.idealSleep,
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyPoppins,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SelectView()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                AppAssets.twoDotsIcon,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: mediaQuery.size.height * 0.05,
          horizontal: mediaQuery.size.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.learnMoreTitle,
              style: TextStyle(
                color: AppColor.primaryColor1,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: AppStrings.fontFamilyPoppins,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.learnMoreSubTitle,
              style: TextStyle(
                color: AppColor.primaryColor4,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: AppStrings.fontFamilyHind,
              ),
            ),
            const SizedBox(height: 20),
            buildKeyPointText(
              AppStrings.learnMoreKeyPointsOne,
              AppStrings.learnMoreKeyPointsOneSub,
            ),
            const SizedBox(height: 10),
            buildKeyPointText(
              AppStrings.learnMoreKeyPointsTwo,
              AppStrings.learnMoreKeyPointsTwoSub,
            ),
            const SizedBox(height: 10),
            buildKeyPointText(
              AppStrings.learnMoreKeyPointsThree,
              AppStrings.learnMoreKeyPointsThreeSub,
            ),
            const SizedBox(height: 10),
            buildKeyPointText(
              AppStrings.conclusion,
              AppStrings.learnMoreConclusion,
            ),
          ],
        ),
      ),
    );
  }
}
