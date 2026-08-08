import 'package:get/get.dart';

class WaterController extends GetxController {
  RxInt waterIntake = 0.obs;

  void incrementWaterIntake() {
    waterIntake.value++;
  }

  void decrementWaterIntake() {
    if (waterIntake.value > 0) {
      waterIntake.value--;
    }
  }
}
