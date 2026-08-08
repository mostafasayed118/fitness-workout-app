import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/calorie_estimation/calorie_estimation_scan.dart';
import 'package:fitness_workout_app_1/view/photo_progress/photo_progress_view.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class CameraNavView extends StatelessWidget {
  const CameraNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
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
          "Select Page", // this will be changed
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyPoppins,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: AppStrings.progressTracker,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotoProgressView(),
                  ),
                );
              },
              backgroundColor: AppColor.white,
              widthSize: media.width * 0.8,
              heightSize: media.height * 0.07,
              borderColor: AppColor.primaryColor1,
              fontSize: 20,
            ),
            const SizedBox(height: 15),
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: AppStrings.caloriesEstimation,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CaloriesEstimationScan(),
                  ),
                );
              },
              backgroundColor: AppColor.white,
              widthSize: media.width * 0.8,
              heightSize: media.height * 0.07,
              borderColor: AppColor.primaryColor1,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
