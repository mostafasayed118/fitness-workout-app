import 'package:fitness_workout_app_1/geminl_calories/new/controllers/nutrition_controller.dart';
import 'package:fitness_workout_app_1/geminl_calories/new/widgets/nutrition_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../view/main_tab/select_view.dart';

class NutritionViewNew extends StatelessWidget {
  final NutritionControllerNew controller = Get.find();

  NutritionViewNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Nutrition Information'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.save),
      //       onPressed: controller.saveRequest,
      //     )
      //   ],
      // ),
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
          "Nutrition Information",
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyPoppins,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: AppColor.primaryColor1, size: 30),
            onPressed: controller.saveRequest,
          ),
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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: NutritionCardNew(
            title: controller.nutritionData.value.title,
            description: controller.nutritionData.value.description,
            // sugar: controller.nutritionData.value.sugar,
            // protein: controller.nutritionData.value.protein,
            // fibers: controller.nutritionData.value.fibers,
            // fats: controller.nutritionData.value.fats,
          ),
        ),
      ),
    );
  }
}
