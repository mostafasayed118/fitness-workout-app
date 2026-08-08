import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/login_and_register/login_view.dart';
import 'package:fitness_workout_app_1/view/login_and_register/register_view.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final double width = media.width;
    final double height = media.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: width * 0.2),
                Image(
                  width: width * 0.9,
                  image: const AssetImage(AppAssets.createAccount),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: width * 0.4),
                      NormalButton(
                        textColor: AppColor.white,
                        text: AppStrings.createAccount,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterView(),
                            ),
                          );
                        },
                        backgroundColor: AppColor.primaryColor1,
                        widthSize: media.width * 0.9,
                        heightSize: media.height * 0.07,
                        borderColor: AppColor.primaryColor1,
                        fontSize: 30,
                      ),
                      SizedBox(height: width * 0.06),
                      NormalButton(
                        textColor: AppColor.primaryColor1,
                        text: AppStrings.login,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        backgroundColor: AppColor.white,
                        widthSize: media.width * 0.9,
                        heightSize: media.height * 0.07,
                        borderColor: AppColor.primaryColor1,
                        fontSize: 32,
                      ),
                      SizedBox(height: width * 0.08),
                      SizedBox(height: width * 0.08),
                      SizedBox(height: width * 0.04),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
