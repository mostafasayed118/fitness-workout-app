import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/home/blank_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../../core/utils/app_colors.dart';
import '../../widget/icon_title_next_row.dart';
import '../../widget/normal_button.dart';
import '../main_tab/select_view.dart';

class AddScheduleView extends StatefulWidget {
  final DateTime date;
  const AddScheduleView({Key? key, required this.date}) : super(key: key);

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              AppAssets.closeIcon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Add Schedule",
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyPoppins,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SelectView()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                AppAssets.twoDotsIcon,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/images/date.png", width: 20, height: 20),
                const SizedBox(width: 8),
                Text(
                  dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                  style: TextStyle(
                    color: AppColor.gray.withOpacity(0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Time",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: AppStrings.fontFamilyPoppins,
              ),
            ),
            SizedBox(
              height: media.width * 0.35,
              child: CupertinoDatePicker(
                onDateTimeChanged: (newDate) {},
                initialDateTime: DateTime.now(),
                use24hFormat: false,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.time,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Details Workout",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: AppStrings.fontFamilyPoppins,
              ),
            ),
            const SizedBox(height: 8),
            IconTitleNextRow(
              icon: "assets/images/choose_workout.png",
              title: "Choose Workout",
              time: "Upper body",
              color: AppColor.gray.withOpacity(0.3),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/images/difficulity.png",
              title: "Difficulity",
              time: "Beginner",
              color: AppColor.gray.withOpacity(0.3),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/images/repetitions.png",
              title: "Custom Repetitions",
              time: "",
              color: AppColor.gray.withOpacity(0.3),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/images/repetitions.png",
              title: "Custom Weights",
              time: "",
              color: AppColor.gray.withOpacity(0.3),
              onPressed: () {},
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 10),
              child: NormalButton(
                textColor: AppColor.primaryColor1,
                text: 'Save',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BlankView()),
                  );
                },
                backgroundColor: AppColor.white,
                widthSize: 200,
                heightSize: 50,
                borderColor: AppColor.primaryColor1,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
