import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/reminder/new_entry/new_entry_bloc.dart';
import 'package:fitness_workout_app_1/widget/convert_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _selectTime() async {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(
      context,
      listen: false,
    );

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;

        //update state via provider, we will do later
        newEntryBloc.updateTime(
          convertTime(_time.hour.toString()) +
              convertTime(_time.minute.toString()),
        );
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.height,
      width: 50.width,
      child: Padding(
        padding: EdgeInsets.only(top: 2.height),
        child: Container(
          width: 40.width,
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(color: AppColor.primaryColor4, blurRadius: 4),
            ],
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColor.white,
              shadowColor: AppColor.primaryColor4,
            ),
            onPressed: () {
              _selectTime();
            },
            child: Center(
              child: Text(
                _clicked == false
                    ? "Select Time"
                    : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.primaryColor4,
                  fontFamily: AppStrings.fontFamilyHind,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
