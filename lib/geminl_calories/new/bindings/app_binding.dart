import 'package:get/get.dart';

import '../controllers/nutrition_controller.dart';

class AppBindingNew extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionControllerNew>(() => NutritionControllerNew());
  }
}
