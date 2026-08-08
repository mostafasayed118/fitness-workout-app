import 'package:fitness_workout_app_1/core/controller/bmi_controller.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/widget/SecBtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiConroller = Get.put(BMIController());
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
      height: 160,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  "${bmiConroller.age.value}",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SecBtn(
                onPress: () {
                  bmiConroller.age.value++;
                },
                icon: Icons.add,
              ),
              SecBtn(
                onPress: () {
                  bmiConroller.age.value--;
                },
                icon: Icons.minimize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
