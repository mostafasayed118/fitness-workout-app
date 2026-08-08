import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_workout_app_1/core/cache/cache_helper.dart';
import 'package:fitness_workout_app_1/core/helper/show_snack_bar.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/forget_password/password_forget_page_one.dart';
import 'package:fitness_workout_app_1/view/login_and_register/register_view.dart';
import 'package:fitness_workout_app_1/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/services/service.locator.dart';
import '../../widget/normal_button.dart';
import '../../widget/round_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool hidePassword = true;

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(
        color: AppColor.primaryColor1,
      ),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: media.height,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: media.width * 0.08),
                    Text(
                      AppStrings.heyThere,
                      style: TextStyle(
                        color: AppColor.primaryColor2,
                        fontSize: 16,
                        fontFamily: AppStrings.fontFamilyHind,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      AppStrings.welcomeBack,
                      style: TextStyle(
                        color: AppColor.primaryColor1,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppStrings.fontFamilyHind,
                      ),
                    ),
                    SizedBox(height: media.width * 0.05),
                    Image.asset(AppAssets.logo, width: 100, height: 100),
                    SizedBox(height: media.width * 0.05),
                    SizedBox(height: media.width * 0.08),
                    RoundTextfield(
                      onChanged: (value) {
                        emailController.text = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      hitText: AppStrings.emailHint,
                      iconPath: AppAssets.emailIcon,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    SizedBox(height: media.width * 0.04),
                    RoundTextfield(
                      onChanged: (value) {
                        passwordController.text = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      controller: passwordController,
                      hitText: AppStrings.passwordHint,
                      obscureText: hidePassword,
                      iconPath: AppAssets.passwordIcon,
                      keyboardType: TextInputType.visiblePassword,
                      rightIcon: TextButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 22,
                          height: 22,
                          child: hidePassword
                              ? Image.asset(
                                  AppAssets.passwordEyeIcon,
                                  width: 22,
                                  height: 22,
                                  fit: BoxFit.contain,
                                )
                              : Image.asset(AppAssets.passwordOfEyeIcon),
                        ),
                      ),
                    ),
                    SizedBox(height: media.width * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PasswordForgetEmailPage(),
                              ),
                            );
                          },
                          child: Text(
                            AppStrings.forgotPassword,
                            style: TextStyle(
                              color: AppColor.primaryColor2,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppStrings.fontFamilyHind,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.width * 0.1),
                    NormalButton(
                      textColor: AppColor.white,
                      text: AppStrings.login,
                      onPressed: () async {
                        if (loginFormKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});

                          try {
                            await loginUser();
                            sl<CacheHelper>()
                                .saveData(
                                  key: AppStrings.onBoardingkey,
                                  value: true,
                                )
                                .then((value) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainTabView(),
                                    ),
                                  );
                                })
                                .catchError((error) {
                                  showSnackBar(
                                    context,
                                    'something went wrong $error',
                                    AppColor.red,
                                  );
                                });
                            showSnackBar(
                              context,
                              'Login Success 🌝',
                              AppColor.primaryColor1,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(
                                context,
                                'user not found for that email.',
                                AppColor.red,
                              );
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(
                                context,
                                'Wrong password for that email',
                                AppColor.red,
                              );
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString(), AppColor.red);
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                        emailController.clear();
                        passwordController.clear();
                      },
                      backgroundColor: AppColor.primaryColor1,
                      widthSize: 330,
                      heightSize: 61,
                      borderColor: AppColor.primaryColor1,
                      fontSize: 32,
                    ),
                    SizedBox(height: media.width * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: AppColor.primaryColor1.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          AppStrings.or,
                          style: TextStyle(
                            color: AppColor.primaryColor2,
                            fontSize: 14,
                            fontFamily: AppStrings.fontFamilyHind,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            color: AppColor.primaryColor1.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.width * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColor.white),
                            child: Image.asset(
                              AppAssets.googleIcon,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(width: media.width * 0.04),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColor.white),
                            child: Image.asset(
                              AppAssets.facebookIcon,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(width: media.width * 0.04),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColor.white),
                            child: Image.asset(
                              AppAssets.twitterIcon,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.width * 0.04),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.dontHaveAccount,
                            style: TextStyle(
                              color: AppColor.primaryColor1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppStrings.fontFamilyHind,
                            ),
                          ),
                          Text(
                            AppStrings.register,
                            style: TextStyle(
                              color: AppColor.primaryColor2,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppStrings.fontFamilyHind,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: media.width * 0.04),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
  }
}
