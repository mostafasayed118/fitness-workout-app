import 'package:fitness_workout_app_1/core/constants.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

import '../view/reminder/new_entry/new_entry_bloc.dart';

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({Key? key}) : super(key: key);

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: 1.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Remind me every',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: kTextColor,
              fontFamily: AppStrings.fontFamilyHind,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
          DropdownButton(
            iconEnabledColor: AppColor.primaryColor1,
            dropdownColor: AppColor.white,
            itemHeight: 8.height,
            hint: _selected == 0
                ? Text(
                    'Select an Interval',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontFamily: AppStrings.fontFamilyHind,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp,
                      color: AppColor.primaryColor4,
                    ),
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColor.primaryColor1,
                    fontFamily: AppStrings.fontFamilyHind,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _selected = newVal!;
                newEntryBloc.updateInterval(newVal);
              });
            },
          ),
          Text(
            _selected == 1 ? " hour" : " hours",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: kTextColor,
              fontFamily: AppStrings.fontFamilyHind,
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
