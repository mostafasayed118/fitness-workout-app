import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../view/main_tab/select_view.dart';
import '../../../widget/normal_button.dart';
import '../viewmodels/meal_plan_viewmodel.dart';
import '../widgets/custom_input_field_meal.dart';
import 'meal_plan_result.dart';

// Form to input user details for generating a meal plan
class MealPlanForm extends StatelessWidget {
  MealPlanForm({super.key});
  final MealPlanViewModel mealPlanViewModel = Get.put(MealPlanViewModel());

  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'Age': TextEditingController(),
    'Height': TextEditingController(),
    'Weight': TextEditingController(),
    'Gender': TextEditingController(),
    'Activity Level': TextEditingController(),
    'Medical Condition': TextEditingController(),
    'Allergies': TextEditingController(),
    'Medication': TextEditingController(),
    'Fitness Goal': TextEditingController(),
    'Stress Level': TextEditingController(),
    'Sleep Pattern': TextEditingController(),
    'Smoker Status': TextEditingController(),
    'Alcohol Status': TextEditingController(),
  };

  final Map<String, IconData> _iconMapping = {
    'Age': Icons.calendar_today,
    'Height': Icons.height,
    'Weight': Icons.line_weight,
    'Gender': Icons.person,
    'Activity Level': Icons.directions_run,
    'Medical Condition': Icons.local_hospital,
    'Allergies': Icons.warning,
    'Medication': Icons.medical_services,
    'Fitness Goal': Icons.flag,
    'Stress Level': Icons.mood,
    'Sleep Pattern': Icons.bedtime,
    'Smoker Status': Icons.smoking_rooms,
    'Alcohol Status': Icons.local_bar,
  };
  final Map<String, TextInputType> keyboardTypes = {
    'Age': TextInputType.number,
    'Height': TextInputType.number,
    'Weight': TextInputType.number,
    'Gender': TextInputType.text,
    'Activity Level': TextInputType.text,
    'Medical Condition': TextInputType.text,
    'Allergies': TextInputType.text,
    'Medication': TextInputType.text,
    'Fitness Goal': TextInputType.text,
    'Stress Level': TextInputType.text,
    'Sleep Pattern': TextInputType.text,
    'Smoker Status': TextInputType.text,
    'Alcohol Status': TextInputType.text,
  };

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
          "Meal Plan Form",
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
        if (mealPlanViewModel.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor1),
              backgroundColor: AppColor.backgroundColor,
              strokeWidth: 5,
              semanticsLabel: 'Loading',
              semanticsValue: 'Loading',
              value: null,
              color: AppColor.primaryColor1,
            ),
          );
        }
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ..._controllers.entries.map((entry) {
                  return CustomInputFieldMeal(
                    keyboardType:
                        keyboardTypes[entry.key] ?? TextInputType.text,
                    iconData: _iconMapping[entry.key] ?? Icons.question_mark,
                    label: entry.key,
                    controller: entry.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter ${entry.key}';
                      }
                      return null;
                    },
                  );
                }).toList(),
                const SizedBox(height: 20),
                NormalButton(
                  textColor: AppColor.primaryColor1,
                  text: 'Generate Meal Plan',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final inputs = _controllers.map(
                        (key, value) => MapEntry(key, value.text),
                      );
                      await mealPlanViewModel.generateMealPlan(inputs);
                      if (mealPlanViewModel.errorMessage.value.isEmpty) {
                        Get.to(MealPlanResult());
                      } else {
                        Get.snackbar(
                          'Error',
                          mealPlanViewModel.errorMessage.value,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColor.red,
                          colorText: AppColor.white,
                          duration: const Duration(seconds: 3),
                          isDismissible: true,
                          shouldIconPulse: true,
                          borderRadius: 15,
                          dismissDirection: DismissDirection.horizontal,
                          margin: const EdgeInsets.all(20),
                          animationDuration: const Duration(seconds: 1),
                          forwardAnimationCurve: Curves.easeOutBack,
                          icon: Icon(
                            Icons.error,
                            color: AppColor.white,
                            size: 30,
                          ),
                        );
                      }
                    }
                  },
                  backgroundColor: AppColor.white,
                  widthSize: 300,
                  heightSize: 60,
                  borderColor: AppColor.primaryColor1,
                  fontSize: 22,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
