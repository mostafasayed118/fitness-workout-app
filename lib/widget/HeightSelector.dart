import 'package:fitness_workout_app_1/core/controller/bmi_controller.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HeightSelector extends StatelessWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiConroller = Get.put(BMIController());
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.primaryColor1,
              blurRadius: 2,
              offset: const Offset(0, 0.5),
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height (CM)",
                  style: TextStyle(fontSize: 15, color: AppColor.black),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => SfSlider.vertical(
                  min: 50,
                  max: 250,
                  value: bmiConroller.height.value,
                  interval: 25,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 5,
                  activeColor: AppColor.primaryColor1,
                  inactiveColor: AppColor.primaryColor1.withOpacity(0.3),
                  onChanged: (dynamic value) {
                    bmiConroller.height.value = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
