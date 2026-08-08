import 'package:fitness_workout_app_1/geminl_meal/new/views/saved_requests_page_meal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../view/main_tab/select_view.dart';
import '../../../widget/normal_button.dart';
import '../viewmodels/meal_plan_viewmodel.dart';

// Page to display the generated meal plan
class MealPlanResult extends StatelessWidget {
  final MealPlanViewModel mealPlanViewModel = Get.find();

  MealPlanResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: TColor.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AppAssets.leftArrowIcon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Meal Plan Result",
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
                MaterialPageRoute(
                  builder: (context) {
                    return const SelectView();
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: TColor.lightGray,
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
      body: Obx(() {
        if (mealPlanViewModel.mealPlans.value == null) {
          return const Center(
            child: Text(
              'No workout plan generated',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontFamily: AppStrings.fontFamilyHind,
              ),
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  mealPlanViewModel.mealPlans.value!.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  mealPlanViewModel.mealPlans.value!.subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor4,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  mealPlanViewModel.mealPlans.value!.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
                const SizedBox(height: 20),
                NormalButton(
                  textColor: AppColor.primaryColor1,
                  text: 'Save',
                  onPressed: mealPlanViewModel.saveMealPlan,
                  backgroundColor: AppColor.white,
                  widthSize: 300,
                  heightSize: 60,
                  borderColor: AppColor.primaryColor1,
                  fontSize: 22,
                ),
                const SizedBox(height: 20),
                NormalButton(
                  textColor: AppColor.primaryColor1,
                  text: 'Saved Requests',
                  onPressed: () {
                    // Navigate to saved requests page
                    Get.to(SavedRequestsMealPage());
                  },
                  backgroundColor: AppColor.white,
                  widthSize: 300,
                  heightSize: 60,
                  borderColor: AppColor.primaryColor1,
                  fontSize: 22,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
