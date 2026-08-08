import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxString Gender = AppStrings.male.obs;
  RxInt weight = 60.obs;
  RxInt age = 20.obs;
  RxDouble height = 100.0.obs;
  RxString BMI = "".obs;
  RxDouble tempBMI = 0.0.obs;
  RxString BMIstatus = "".obs;
  Rx<Color> colorStattus = AppColor.primaryColor1.obs;

  void genderHandle(String gender) {
    Gender.value = gender;
  }

  void calculatorBMI() {
    var hMeter = height / 100;
    tempBMI.value = weight / (hMeter * hMeter);
    BMI.value = tempBMI.toStringAsFixed(1);
    tempBMI.value = double.parse(BMI.value);
    findStatus();
  }

  void findStatus() {
    if (tempBMI.value < 18.5) {
      BMIstatus.value = "UnderWeight";
      colorStattus.value = const Color(0xffFFB800);
    }
    if (tempBMI.value > 18.5 && tempBMI.value < 24.9) {
      BMIstatus.value = "Normal";
      colorStattus.value = const Color(0xff00CA39);
    }
    if (tempBMI.value > 25.0 && tempBMI.value < 29.9) {
      BMIstatus.value = "OverWeight";
      colorStattus.value = const Color(0xffFF5858);
    }
    if (tempBMI.value > 30.0 && tempBMI.value < 34.9) {
      BMIstatus.value = "OBESE";
      colorStattus.value = const Color(0xffFF0000);
    }
    if (tempBMI.value > 35.0) {
      BMIstatus.value = "Extremely OBESE";

      colorStattus.value = const Color(0xff000000);
    }
  }
}
