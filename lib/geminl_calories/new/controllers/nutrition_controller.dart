import 'package:fitness_workout_app_1/geminl_calories/new/views/nutrition_view.dart';
import 'package:fitness_workout_app_1/geminl_calories/new/widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/app_colors.dart';
import '../models/nutrition_model.dart';
import '../services/gemini_service.dart';

class NutritionControllerNew extends GetxController {
  var isLoading = false.obs;
  var nutritionData = NutritionModelNew().obs;
  var savedRequests = <NutritionModelNew>[].obs;
  final ImagePicker _picker = ImagePicker();

  // Capture image using camera
  void captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _getNutritionValues(pickedFile);
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.red,
        colorText: AppColor.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        shouldIconPulse: true,
        borderRadius: 15,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.all(20),
        animationDuration: const Duration(seconds: 1),
        forwardAnimationCurve: Curves.easeOutBack,
        icon: Icon(Icons.error, color: AppColor.white, size: 30),
      );
    }
  }

  // Load image from gallery
  void loadImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _getNutritionValues(pickedFile);
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.red,
        colorText: AppColor.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        shouldIconPulse: true,
        borderRadius: 15,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.all(20),
        animationDuration: const Duration(seconds: 1),
        forwardAnimationCurve: Curves.easeOutBack,
        icon: Icon(Icons.error, color: AppColor.white, size: 30),
      );
    }
  }

  // Get nutrition values from Gemini API
  void _getNutritionValues(XFile file) async {
    isLoading(true);
    try {
      var result = await GeminiServiceNew().getNutritionValues(file);
      nutritionData.value = NutritionModelNew.fromMap(result);
      isLoading(false);
      Get.to(() => NutritionViewNew());
    } catch (e) {
      isLoading(false);
      Get.dialog(ErrorDialogNew(message: 'Failed to get nutrition values: $e'));
    }
  }

  // Save request
  void saveRequest() {
    savedRequests.add(nutritionData.value);
    Get.snackbar(
      'Success',
      'Request saved successfully',
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

  // Delete request
  void deleteRequest(int index) {
    savedRequests.removeAt(index);
    Get.snackbar(
      'Success',
      'Request deleted successfully',
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
