import 'package:fitness_workout_app_1/core/models/medicine_type.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/reminder/new_entry/new_entry_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn({
    Key? key,
    required this.medicineType,
    required this.name,
    required this.iconPath,
    required this.isSelected,
  }) : super(key: key);
  final MedicineType medicineType;
  final String name;
  final String iconPath;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        //select medicine type
        // create a new block for selecting and adding new entry
        newEntryBloc.updateSelectedMedicine(medicineType);
      },
      child: Column(
        children: [
          Container(
            width: 20.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.height),
              color: isSelected ? AppColor.primaryColor1 : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? AppColor.primaryColor1
                      : AppColor.primaryColor4,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 1.height, bottom: 1.height),
                child: SvgPicture.asset(
                  iconPath,
                  height: 7.height,
                  color: isSelected ? Colors.white : AppColor.primaryColor1,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.height),
            child: Container(
              width: 20.width,
              height: 4.height,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primaryColor1 : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isSelected ? Colors.white : AppColor.primaryColor1,
                    fontFamily: AppStrings.fontFamilyHind,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
