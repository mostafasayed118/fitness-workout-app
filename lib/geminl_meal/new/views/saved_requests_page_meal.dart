import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../view/main_tab/select_view.dart';
import '../../../widget/normal_button.dart';
import '../viewmodels/meal_plan_viewmodel.dart';

// Page to display saved meal plans
class SavedRequestsMealPage extends StatelessWidget {
  final MealPlanViewModel viewModelMeal = Get.find();

  SavedRequestsMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final saveMealPlan = viewModelMeal.getSavedMealPlans();
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
          "Saved Requests",
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
      body: ListView.builder(
        itemCount: saveMealPlan.length,
        itemBuilder: (context, index) {
          final mealPlan = saveMealPlan[index];
          return ListTile(
            title: Text(
              mealPlan.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.fontFamilyHind,
                color: AppColor.primaryColor4,
              ),
            ),
            subtitle: Text(
              mealPlan.subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: AppStrings.fontFamilyHind,
                color: AppColor.primaryColor1,
              ),
            ),
            trailing: IconButton(
              // tooltip: 'Delete',
              icon: const Icon(Icons.delete, color: Colors.red, size: 30),
              onPressed: () {
                viewModelMeal.deleteMealPlan(index);
                // Refresh the list of saved plans after deleting a plan at the same time
                Get.off(SavedRequestsMealPage());
                Get.forceAppUpdate();
              },
            ),
            onTap: () {
              Get.dialog(
                AlertDialog(
                  backgroundColor: AppColor.backgroundColor,
                  title: Text(
                    mealPlan.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.fontFamilyHind,
                      color: AppColor.primaryColor4,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealPlan.subtitle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppStrings.fontFamilyHind,
                            color: AppColor.primaryColor1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          mealPlan.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black,
                            fontFamily: AppStrings.fontFamilyHind,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    NormalButton(
                      textColor: AppColor.primaryColor1,
                      text: 'Close',
                      onPressed: () => Get.back(),
                      backgroundColor: AppColor.white,
                      widthSize: 60,
                      heightSize: 20,
                      borderColor: AppColor.primaryColor1,
                      fontSize: 18,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
