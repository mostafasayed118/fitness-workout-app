import 'package:fitness_workout_app_1/core/global_bloc.dart';
import 'package:fitness_workout_app_1/core/models/medicine.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(bottom: 1.height),
          child: Text(
            AppStrings.worryLess,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColor.primaryColor1,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontFamily: AppStrings.fontFamilyPoppins,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(bottom: 1.height),
          child: Text(
            AppStrings.welcomeToDailyDose,
            style: TextStyle(
              color: AppColor.primaryColor4,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              fontFamily: AppStrings.fontFamilyPoppins,
            ),
          ),
        ),
        SizedBox(height: 2.height),
        //lets show number of saved medicines from shared preferences
        StreamBuilder<List<Medicine>>(
          stream: globalBloc.medicineList$,
          builder: (context, snapshot) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 1.height),
              child: Text(
                !snapshot.hasData ? '0' : snapshot.data!.length.toString(),
                style: TextStyle(
                  color: AppColor.primaryColor1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppStrings.fontFamilyPoppins,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
