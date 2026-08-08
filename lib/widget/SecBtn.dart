import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SecBtn extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  const SecBtn({super.key, required this.onPress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.primaryColor1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: AppColor.white, size: 23),
      ),
    );
  }
}
