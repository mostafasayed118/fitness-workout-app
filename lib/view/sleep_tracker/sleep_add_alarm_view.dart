import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../widget/icon_title_next_row.dart';
import '../main_tab/select_view.dart';

class SleepAddAlarmView extends StatefulWidget {
  final DateTime date;
  const SleepAddAlarmView({Key? key, required this.date}) : super(key: key);

  @override
  State<SleepAddAlarmView> createState() => _SleepAddAlarmViewState();
}

class _SleepAddAlarmViewState extends State<SleepAddAlarmView> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

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
            decoration: BoxDecoration(
              // color: TColor.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AppAssets.leftArrowIcon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Add Alarm",
          style: TextStyle(
            color: AppColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyHind,
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
                // color: TColor.lightGray,
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
            const SizedBox(height: 8),
            IconTitleNextRow(
              icon: "assets/images/Bed_Add.png",
              title: "Bedtime",
              time: "09:00 PM",
              color: Colors.grey.shade400,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/images/HoursTime.png",
              title: "Hours of sleep",
              time: "8 hours | 30 minutes",
              color: Colors.grey.shade400,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/images/Repeat.png",
              title: "Repeat",
              time: "Mon to Fri",
              color: Colors.grey.shade400,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 15),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/Vibrate.png",
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Vibrate When Alarm Sound",
                      style: TextStyle(color: AppColor.gray, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Transform.scale(
                      scale: 0.7,
                      child: CustomAnimatedToggleSwitch<bool>(
                        current: positive,
                        values: const [false, true],
                        dif: 0.0,
                        indicatorSize: const Size.square(30.0),
                        animationDuration: const Duration(milliseconds: 200),
                        animationCurve: Curves.linear,
                        onChanged: (b) => setState(() => positive = b),
                        iconBuilder: (context, local, global) {
                          return const SizedBox();
                        },
                        defaultCursor: SystemMouseCursors.click,
                        onTap: () => setState(() => positive = !positive),
                        iconsTappable: false,
                        wrapperBuilder: (context, global, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 10.0,
                                right: 10.0,
                                height: 30.0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: positive
                                        ? AppColor.primaryColor1
                                        : AppColor.gray.withOpacity(0.3),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                              child,
                            ],
                          );
                        },
                        foregroundIndicatorBuilder: (context, global) {
                          return SizedBox.fromSize(
                            size: const Size(10, 10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 0.05,
                                    blurRadius: 1.1,
                                    offset: Offset(0.0, 0.8),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: 'Add',
              onPressed: () {},
              backgroundColor: AppColor.white,
              widthSize: 315,
              heightSize: 60,
              borderColor: AppColor.primaryColor1,
              fontSize: 18,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
