// ignore_for_file: deprecated_member_use

import 'package:fitness_workout_app_1/core/models/medicine.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/reminder/medicine_details/medicine_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;
  //for getting the current details of the saved items

  Hero makeIcon(double size) {
    //here is the bug, the capital word of the first letter

    if (medicine.medicineType == AppStrings.bottle) {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          AppAssets.bottleIcon,
          color: AppColor.primaryColor1,
          height: 7.height,
        ),
      );
    } else if (medicine.medicineType == AppStrings.pills) {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          AppAssets.pillIcon,
          color: AppColor.primaryColor4,
          height: 7.height,
        ),
      );
    } else if (medicine.medicineType == AppStrings.syringe) {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          AppAssets.syringeIcon,
          color: AppColor.primaryColor1,
          height: 7.height,
        ),
      );
    } else if (medicine.medicineType == AppStrings.tablet) {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          AppAssets.tabletIcon,
          color: AppColor.primaryColor4,
          height: 7.height,
        ),
      );
    }
    //in case of no medicine type icon selection
    return Hero(
      tag: medicine.medicineName! + medicine.medicineType!,
      child: Icon(Icons.error, color: AppColor.red, size: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColor.white,
      splashColor: AppColor.primaryColor1.withOpacity(0.2),
      onTap: () {
        //go to details activity with animation, later

        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder:
                (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, Widget? child) {
                      return Opacity(
                        opacity: animation.value,
                        child: MedicineDetails(medicine),
                      );
                    },
                  );
                },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 2.width,
          right: 2.width,
          top: 1.height,
          bottom: 2.height,
        ),
        margin: EdgeInsets.all(1.height),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(2.height),
          boxShadow: [BoxShadow(blurRadius: 2, color: AppColor.primaryColor1)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            //call the function here icon type
            //later we will the icon issue
            makeIcon(7.height),
            const Spacer(),
            //hero tag animation, later
            Hero(
              tag: medicine.medicineName!,
              child: Text(
                medicine.medicineName!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: AppStrings.fontFamilyPoppins,
                  color: AppColor.black,
                  fontSize: 15.sp,
                ),
              ),
            ),
            SizedBox(height: 0.3.height),
            //time interval data with condition, later
            Text(
              medicine.interval == 1
                  ? "Every ${medicine.interval} hour"
                  : "Every ${medicine.interval} hour",
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: AppStrings.fontFamilyPoppins,
                color: AppColor.black.withOpacity(0.7),
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
