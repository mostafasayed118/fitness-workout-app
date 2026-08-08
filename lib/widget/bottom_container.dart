import 'package:fitness_workout_app_1/core/global_bloc.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/widget/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return StreamBuilder(
      stream: globalBloc.medicineList$,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //if no data is saved
          return Container();
        } else if (snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              AppStrings.noMedicine,
              style: TextStyle(
                color: AppColor.primaryColor4,
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                fontFamily: AppStrings.fontFamilyPoppins,
              ),
            ),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 1.height),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MedicineCard(medicine: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}
