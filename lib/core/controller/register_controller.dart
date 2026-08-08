import 'package:fitness_workout_app_1/core/data/repositories.authebtication/authentication_repository.dart';
import 'package:fitness_workout_app_1/core/helper/loaders.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final hidePassword = true.obs;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  Future<void> register() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppAssets.successCheck,
      );
      // final isConnected = await NetworkManager.instance.isConnected();

      if (!registerFormKey.currentState!.validate()) {
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
    } catch (e) {
      TLoaders.errorSnackNar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoadingDialog();
    }
  }
}
