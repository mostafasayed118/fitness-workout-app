import 'package:fitness_workout_app_1/core/controller/bmi_controller.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/main_tab/select_view.dart';
import 'package:fitness_workout_app_1/widget/RactButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    BMIController bmiController = Get.put(BMIController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(screenWidth * 0.02),
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
                margin: EdgeInsets.all(screenWidth * 0.02),
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
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                        ),
                        child: Text(
                          "Your BMI Is",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: bmiController.colorStattus.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                SizedBox(
                  height: screenHeight * 0.4,
                  child: Expanded(
                    child: Obx(
                      () => CircularPercentIndicator(
                        animationDuration: 1000,
                        footer: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                          ),
                          child: Text(
                            bmiController.BMIstatus.value,
                            style: TextStyle(
                              color: bmiController.colorStattus.value,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        radius: screenWidth * 0.3,
                        lineWidth: screenWidth * 0.06,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: bmiController.tempBMI.value / 100,
                        center: Text(
                          "${bmiController.BMI.value}%",
                          style: TextStyle(
                            color: bmiController.colorStattus.value,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: bmiController.colorStattus.value,
                        backgroundColor: bmiController.colorStattus.value
                            .withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("Your BMI is "),
                            Text(
                              "${bmiController.BMI.value} kg/m2",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Indicating your weight is in the ${bmiController.BMIstatus.value} category for adults of your height. For your height, a normal weight range would be from 53.5 to 72 kilograms. Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                MyRactButton(
                  onPress: () {
                    Get.back();
                  },
                  btnName: AppStrings.done,
                  icon: Icons.arrow_back_ios_new_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
