import 'package:fitness_workout_app_1/core/controller/bmi_controller.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String btnName;
  final VoidCallback onPress;
  const PrimaryButton({
    super.key,
    required this.icon,
    required this.btnName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    BMIController bmiConroller = Get.put(BMIController());
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Obx(
          () => Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: AppColor.primaryColor1,
                  blurRadius: 2,
                  offset: const Offset(0, 0.5),
                  spreadRadius: 0.5,
                ),
              ],
              color: bmiConroller.Gender.value == btnName
                  ? AppColor.primaryColor1
                  : AppColor.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: bmiConroller.Gender.value == btnName
                      ? AppColor.white
                      : AppColor.black,
                ),
                const SizedBox(width: 10),
                Text(
                  btnName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: bmiConroller.Gender.value == btnName
                        ? AppColor.white
                        : AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
