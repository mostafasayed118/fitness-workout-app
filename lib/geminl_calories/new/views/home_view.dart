import 'package:fitness_workout_app_1/geminl_calories/new/controllers/nutrition_controller.dart';
import 'package:fitness_workout_app_1/geminl_calories/new/views/saved_requests_view.dart';
import 'package:fitness_workout_app_1/geminl_calories/new/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../view/main_tab/select_view.dart';
import '../../../widget/normal_button.dart';

class HomeViewNew extends StatelessWidget {
  final NutritionControllerNew controller = Get.find();

  HomeViewNew({super.key});

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
          "Calorie Estimates Scanner",
          style: TextStyle(
            color: AppColor.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyPoppins,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.list, color: AppColor.primaryColor1, size: 30),
            onPressed: () {
              Get.to(() => SavedRequestsView());
            },
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: 'Capture Image',
              onPressed: controller.captureImage,
              backgroundColor: AppColor.white,
              widthSize: 300,
              heightSize: 60,
              borderColor: AppColor.primaryColor1,
              fontSize: 22,
            ),
            const SizedBox(height: 20),
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: 'Load from Gallery',
              onPressed: controller.loadImage,
              backgroundColor: AppColor.white,
              widthSize: 300,
              heightSize: 60,
              borderColor: AppColor.primaryColor1,
              fontSize: 22,
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? const LoaderNew()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
