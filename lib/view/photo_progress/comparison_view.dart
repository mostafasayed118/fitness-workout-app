import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../widget/icon_title_next_row.dart';
import '../main_tab/main_tab_view.dart';
import '../main_tab/select_view.dart';
import 'result_view.dart';

class ComparisonView extends StatelessWidget {
  const ComparisonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainTabView();
                },
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              AppAssets.leftArrowIcon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Comparison",
          style: textTheme.titleLarge?.copyWith(
            color: AppColor.black,
            fontSize: 16,
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
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: mediaQuery.size.height * 0.02,
          horizontal: mediaQuery.size.width * 0.05,
        ),
        child: Column(
          children: [
            IconTitleNextRow(
              icon: "assets/images/date.png",
              title: "Select Month 1",
              time: "May",
              onPressed: () {},
              color: AppColor.gray,
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
            IconTitleNextRow(
              icon: "assets/images/date.png",
              title: "Select Month 2",
              time: "select Month",
              onPressed: () {},
              color: AppColor.gray,
            ),
            const Spacer(),
            NormalButton(
              textColor: AppColor.primaryColor1,
              text: 'Compare',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultView(
                      date1: DateTime(2024, 1, 1),
                      date2: DateTime(2024, 2, 1),
                    ),
                  ),
                );
              },
              backgroundColor: AppColor.white,
              widthSize: mediaQuery.size.width * 0.9,
              heightSize: mediaQuery.size.height * 0.07,
              borderColor: AppColor.primaryColor1,
              fontSize: 16,
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
          ],
        ),
      ),
    );
  }
}
