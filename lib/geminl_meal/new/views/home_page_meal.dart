import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../view/main_tab/select_view.dart';
import '../../../widget/normal_button.dart';
import 'meal_plan_form.dart';
import 'saved_requests_page_meal.dart';

// Home page of the app
class MealHomePage extends StatelessWidget {
  const MealHomePage({super.key});

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
          "Meal Plan Generator",
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
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: 'Generate Meal Plan',
              onPressed: () => Get.to(MealPlanForm()),
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
              onPressed: () => Get.to(SavedRequestsMealPage()),
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
  }
}
