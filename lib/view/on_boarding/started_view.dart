import 'package:fitness_workout_app_1/core/cache/cache_helper.dart';
import 'package:fitness_workout_app_1/core/services/service.locator.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/login_and_register/login_view.dart';
import 'package:fitness_workout_app_1/view/on_boarding/on_boarding_view.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class StartedView extends StatelessWidget {
  const StartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final isPortrait = media.height > media.width;
    final double fontSize = isPortrait ? 40 : 30;
    bool isVisted =
        sl<CacheHelper>().getData(key: AppStrings.onBoardingkey) ?? false;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        width: media.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Text(
              AppStrings.welcomeIn,
              style: TextStyle(
                color: AppColor.primaryColor1,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.fontFamilyPoppins,
              ),
            ),
            Text(
              AppStrings.nutrifix,
              style: TextStyle(
                color: AppColor.primaryColor1,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.fontFamilyPoppins,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(AppAssets.splashScreen),
            const Spacer(flex: 1),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Stack(
                  children: [
                    SlideAction(
                      child: NormalButton(
                        textColor: AppColor.white,
                        text: AppStrings.getStarted,
                        onPressed: () {
                          // Go to next screen

                          //! when user visited
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => isVisted
                                  ? const LoginView()
                                  : const OnBoardingView(),
                            ),
                          );
                        },
                        backgroundColor: AppColor.primaryColor1,
                        widthSize: 344,
                        heightSize: 70,
                        borderColor: AppColor.primaryColor1,
                        fontSize: 25,
                      ),
                      onSubmit: () {
                        // Go to next screen

                        //! when user visited
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => isVisted
                                ? const LoginView()
                                : const OnBoardingView(),
                          ),
                        );
                        return null;
                      },
                      sliderRotate: false,
                      borderRadius: 30,
                      elevation: 0,
                      outerColor: AppColor.primaryColor4,
                      innerColor: Colors.white,
                      sliderButtonIcon: Image.asset(
                        AppAssets.rightArrowIcon,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
