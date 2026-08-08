// ignore_for_file: deprecated_member_use

import 'package:fitness_workout_app_1/core/models/medicine.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/view/reminder/medicine_details/main_info_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

import '../../../core/utils/app_assets.dart';

class MainSection extends StatelessWidget {
  const MainSection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;
  Hero makeIcon(double size) {
    if (medicine!.medicineType == 'Bottle') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          AppAssets.bottleIcon,
          color: AppColor.primaryColor1,
          height: 7.height,
        ),
      );
    } else if (medicine!.medicineType == 'Pill') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          AppAssets.pillIcon,
          color: AppColor.primaryColor4,
          height: 7.height,
        ),
      );
    } else if (medicine!.medicineType == 'Syringe') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          AppAssets.syringeIcon,
          color: AppColor.primaryColor1,
          height: 7.height,
        ),
      );
    } else if (medicine!.medicineType == 'Tablet') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          AppAssets.tabletIcon,
          color: AppColor.primaryColor4,
          height: 7.height,
        ),
      );
    }
    //in case of no medicine type icon selection
    return Hero(
      tag: medicine!.medicineName! + medicine!.medicineType!,
      child: Icon(Icons.error, color: AppColor.red, size: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        makeIcon(7.height),
        SizedBox(width: 2.width),
        Column(
          children: [
            Hero(
              tag: medicine!.medicineName!,
              child: Material(
                color: Colors.transparent,
                child: MainInfoTab(
                  fieldTitle: 'Medicine Name',
                  fieldInfo: medicine!.medicineName!,
                ),
              ),
            ),
            MainInfoTab(
              fieldTitle: 'Dosage',
              fieldInfo: medicine!.dosage == 0
                  ? 'Not Specified'
                  : "${medicine!.dosage} mg",
            ),
          ],
        ),
      ],
    );
  }
}
