import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/geminl_calories/new/views/home_view.dart';
import 'package:fitness_workout_app_1/view/home/home_view.dart';
import 'package:fitness_workout_app_1/view/photo_progress/photo_progress_view.dart';
import 'package:fitness_workout_app_1/view/reminder/home_page_reminder.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../meal_planner/meal_planner_view.dart';
import '../sleep_tracker/sleep_tracker_view.dart';
import '../workout_tracker/workout_tracker_view.dart';

class SelectView extends StatelessWidget {
  const SelectView({Key? key}) : super(key: key);

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
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: AppStrings.home,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
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
              text: AppStrings.workoutTracker,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkoutTrackerView(),
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
              text: AppStrings.mealPlanner,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MealPlannerView(),
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
              text: AppStrings.sleepTracker,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SleepTrackerView(),
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
                    builder: (context) => HomeViewNew(),
                    //  const CaloriesEstimationScan(),
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

            //HomePageReminder
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: AppStrings.reminder,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePageReminder(),
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
