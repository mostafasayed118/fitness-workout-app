import 'package:fitness_workout_app_1/core/controller/bmi_controller.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/bmi/ResultPage.dart';
import 'package:fitness_workout_app_1/view/main_tab/select_view.dart';
import 'package:fitness_workout_app_1/widget/AgeSelector.dart';
import 'package:fitness_workout_app_1/widget/HeightSelector.dart';
import 'package:fitness_workout_app_1/widget/PrimaryButton.dart';
import 'package:fitness_workout_app_1/widget/RactButton.dart';
import 'package:fitness_workout_app_1/widget/WeightSelector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageBmi extends StatelessWidget {
  const HomePageBmi({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiConroller = Get.put(BMIController());
    final double screenWidth = MediaQuery.of(context).size.width;

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
            margin: const EdgeInsets.all(10),
            height: screenWidth * 0.1,
            width: screenWidth * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            child: Image.asset(
              AppAssets.leftArrowIcon,
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          AppStrings.titleBmi,
          style: TextStyle(
            color: AppColor.black,
            fontSize: screenWidth * 0.05,
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
              height: screenWidth * 0.1,
              width: screenWidth * 0.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
              child: Image.asset(
                AppAssets.twoDotsIcon,
                width: screenWidth * 0.08,
                height: screenWidth * 0.08,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Welcome 😊",
                    style: TextStyle(color: AppColor.gray.withOpacity(0.9)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Mustafa",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  PrimaryButton(
                    onPress: () {
                      bmiConroller.genderHandle(AppStrings.male);
                    },
                    icon: Icons.male,
                    btnName: AppStrings.male,
                  ),
                  const SizedBox(width: 20),
                  PrimaryButton(
                    onPress: () {
                      bmiConroller.genderHandle(AppStrings.female);
                    },
                    icon: Icons.female,
                    btnName: AppStrings.female,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeightSelector(),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Weight ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.black,
                                ),
                              ),
                              Text(
                                "(KG)",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                ),
                              ),
                            ],
                          ),
                          const WeightSelector(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                          const AgeSelector(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MyRactButton(
                onPress: () {
                  bmiConroller.calculatorBMI();
                  Get.to(const ResultPage());
                },
                btnName: AppStrings.calculate,
                icon: Icons.done_all_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
