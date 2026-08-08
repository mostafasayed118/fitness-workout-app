import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../core/utils/app_colors.dart';
import '../models/meal_plan_model.dart';

// ViewModel to handle the business logic for meal plan generation
class MealPlanViewModel extends GetxController {
  var isLoading = false.obs;
  var mealPlans = Rxn<MealPlan>();
  var errorMessage = ''.obs;

  final mealPlanStorage = GetStorage();

  static const String _apiKey = String.fromEnvironment(
    'GEMINI_API_KEY',
    defaultValue: '',
  );

  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: _apiKey,
  );

  Future<void> generateMealPlan(Map<String, String> inputs) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final content = [Content.text(inputs.toString())];
      final response = await model.generateContent(content);
      mealPlans.value = MealPlan.fromApiResponse(response.text!);
    } catch (e) {
      errorMessage.value = 'Failed to generate meal plan';
    } finally {
      isLoading.value = false;
    }
  }

  void saveMealPlan() {
    if (mealPlans.value != null) {
      final plans = mealPlanStorage.read<List>('mealPlans') ?? [];
      plans.add({
        'title': mealPlans.value!.title,
        'subtitle': mealPlans.value!.subtitle,
        'description': mealPlans.value!.description,
      });
      mealPlanStorage.write('mealPlans', plans);
      Get.snackbar(
        'Success',
        'Workout plan saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColor.primaryColor1,
        colorText: AppColor.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        isDismissible: true,
        shouldIconPulse: true,
        dismissDirection: DismissDirection.horizontal,
        icon: Icon(Icons.check, color: AppColor.white),
      );
    }
  }

  void deleteMealPlan(int index) {
    final plans = mealPlanStorage.read<List>('mealPlans') ?? [];
    if (plans.isNotEmpty && index >= 0 && index < plans.length) {
      plans.removeAt(index);
      mealPlanStorage.write('mealPlans', plans);
      Get.snackbar(
        'Success',
        'Workout plan deleted successfully!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColor.primaryColor1,
        colorText: AppColor.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        isDismissible: true,
        shouldIconPulse: true,
        dismissDirection: DismissDirection.horizontal,
        icon: Icon(Icons.check, color: AppColor.white),
      );
    }
  }

  List<MealPlan> getSavedMealPlans() {
    final plans = mealPlanStorage.read<List>('mealPlans') ?? [];
    return plans
        .map(
          (plan) => MealPlan(
            title: plan['title'],
            subtitle: plan['subtitle'],
            description: plan['description'],
          ),
        )
        .toList();
  }
}
