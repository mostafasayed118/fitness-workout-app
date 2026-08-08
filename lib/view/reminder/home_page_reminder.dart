import 'package:fitness_workout_app_1/core/constants.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/main_tab/select_view.dart';
import 'package:fitness_workout_app_1/view/reminder/new_entry/new_entry_page.dart';
import 'package:fitness_workout_app_1/widget/bottom_container.dart';
import 'package:fitness_workout_app_1/widget/top_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class HomePageReminder extends StatelessWidget {
  const HomePageReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          AppStrings.reminder,
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Hind',
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
      body: Padding(
        padding: EdgeInsets.all(2.height),
        child: Column(
          children: [
            const TopContainer(),
            SizedBox(height: 2.height),
            //the widget take space as per need
            const Flexible(child: BottomContainer()),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          // go to new entry page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewEntryPage()),
          );
        },
        child: SizedBox(
          width: 20.width,
          height: 9.height,
          child: Card(
            color: AppColor.primaryColor1,
            shape: const StadiumBorder(
              side: BorderSide(
                color: kPrimaryColor,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Icon(Icons.add_outlined, color: kScaffoldColor, size: 30.sp),
          ),
        ),
      ),
    );
  }
}
