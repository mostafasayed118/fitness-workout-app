import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyRactButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final String btnName;
  const MyRactButton({
    super.key,
    required this.onPress,
    required this.btnName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 56,
        width: 320,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.primaryColor1,
              blurRadius: 3,
              offset: const Offset(0, 0.5),
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Text(
              btnName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
