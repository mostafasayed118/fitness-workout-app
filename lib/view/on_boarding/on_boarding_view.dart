import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/on_boarding/create_acc.dart';
import 'package:fitness_workout_app_1/widget/on_boarding_page.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List<Map<String, String>> pageArea = [
    {
      "title": AppStrings.onboardingTitleOne,
      "subtitle": AppStrings.onboardingSubTitleOne,
      "image": AppAssets.onboarding1,
    },
    {
      "title": AppStrings.onboardingTitleTwo,
      "subtitle": AppStrings.onboardingSubTitleTwo,
      "image": AppAssets.onboarding2,
    },
    {
      "title": AppStrings.onboardingTitleThree,
      "subtitle": AppStrings.onboardingSubTitleThree,
      "image": AppAssets.onboarding3,
    },
    {
      "title": AppStrings.onboardingTitleFour,
      "subtitle": AppStrings.onboardingSubTitleFour,
      "image": AppAssets.onboarding4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArea.length,
            itemBuilder: (context, index) {
              var pageObject = pageArea[index];

              return OnBoardingPage(pageObject: pageObject);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  child: Text(
                    AppStrings.skip,
                    style: TextStyle(
                      fontFamily: AppStrings.fontFamilyPoppins,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor1,
                        value: (selectPage + 1) / 4,
                        strokeWidth: 2,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 30,
                      ),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor1,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.navigate_next, color: AppColor.white),
                        onPressed: () {
                          if (selectPage < 3) {
                            selectPage = selectPage + 1;
                            controller.animateToPage(
                              selectPage,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateAccount(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
