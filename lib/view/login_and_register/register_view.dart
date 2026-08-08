import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_workout_app_1/core/helper/show_snack_bar.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/core/utils/validators/validators.dart';
// import 'package:fitness_workout_app_1/common_widget/round_button.dart';
import 'package:fitness_workout_app_1/view/login_and_register/complete_profile_view.dart';
import 'package:fitness_workout_app_1/view/login_and_register/login_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widget/normal_button.dart';
import '../../widget/round_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  bool isSee = false;
  bool isLoading = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

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
        body: Form(
          key: registerFormKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: media.width * 0.06),
                    Text(
                      AppStrings.heyThere,
                      style: TextStyle(
                        color: AppColor.primaryColor2,
                        fontSize: 16,
                        fontFamily: AppStrings.fontFamilyPoppins,
                      ),
                    ),
                    Text(
                      AppStrings.createAnAccount,
                      style: TextStyle(
                        color: AppColor.primaryColor1,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppStrings.fontFamilyPoppins,
                      ),
                    ),
                    SizedBox(height: media.width * 0.02),
                    Image.asset(AppAssets.logo, width: 100, height: 100),
                    SizedBox(height: media.width * 0.02),
                    RoundTextfield(
                      onChanged: (value) {
                        fullNameController.text = value;
                      },
                      controller: fullNameController,
                      validator: (value) => TextValidator.validateName(value),
                      hitText: AppStrings.fulNameHint,
                      iconPath: AppAssets.userIcon,
                    ),
                    SizedBox(height: media.width * 0.04),
                    RoundTextfield(
                      onChanged: (value) {
                        phoneController.text = value;
                      },
                      validator: (value) =>
                          TextValidator.validatePhoneNumber(value),
                      controller: phoneController,
                      hitText: AppStrings.phoneHint,
                      iconPath: AppAssets.phoneIcon,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: media.width * 0.04),
                    RoundTextfield(
                      onChanged: (value) {
                        emailController.text = value;
                      },
                      validator: (value) => TextValidator.validateEmail(value),
                      controller: emailController,
                      hitText: AppStrings.emailHint,
                      iconPath: AppAssets.emailIcon,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: media.width * 0.04),
                    RoundTextfield(
                      onChanged: (value) {
                        countryController.text = value;
                      },
                      validator: (value) =>
                          TextValidator.validateCountry(value),
                      controller: countryController,
                      hitText: AppStrings.countryhint,
                      iconPath: AppAssets.countryIcon,
                    ),
                    SizedBox(height: media.width * 0.04),
                    RoundTextfield(
                      onChanged: (value) {
                        passwordController.text = value;
                      },
                      validator: (value) =>
                          TextValidator.validatePassword(value),
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
                    SizedBox(height: media.width * 0.04),
                    RoundTextfield(
                      onChanged: (value) {
                        confirmPasswordController.text = value;
                      },
                      validator: (value) =>
                          TextValidator.validatecomfirmPassword(
                            value,
                            passwordController.text,
                          ),
                      controller: confirmPasswordController,
                      hitText: AppStrings.confirmPasswordHint,
                      obscureText: hideConfirmPassword,
                      iconPath: AppAssets.passwordIcon,
                      keyboardType: TextInputType.visiblePassword,
                      rightIcon: TextButton(
                        onPressed: () {
                          setState(() {
                            hideConfirmPassword = !hideConfirmPassword;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 22,
                          height: 22,
                          child: hideConfirmPassword
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
                    SizedBox(height: media.width * 0.04),
                    SizedBox(height: media.width * 0.1),
                    NormalButton(
                      textColor: AppColor.white,
                      text: AppStrings.register,
                      onPressed: () async {
                        if (registerFormKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser();
                            addUser();
                            showSnackBar(
                              context,
                              'Success ',
                              AppColor.primaryColor1,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CompleteProfileView(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(
                                context,
                                'The password provided is too weak.',
                                AppColor.red,
                              );
                              return;
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(
                                context,
                                'The account already exists for that email.',
                                AppColor.red,
                              );
                              return;
                            }

                            if (e.code == 'invalid-email') {
                              showSnackBar(
                                context,
                                'The email address is badly formatted.',
                                AppColor.red,
                              );
                              return;
                            }

                            if (e.code == 'operation-not-allowed') {
                              showSnackBar(
                                context,
                                'Operation not allowed.',
                                AppColor.red,
                              );
                              return;
                            }

                            if (e.code == 'user-disabled') {
                              showSnackBar(
                                context,
                                'The user account has been disabled.',
                                AppColor.red,
                              );
                              return;
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString(), AppColor.red);
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                        fullNameController.clear();
                        phoneController.clear();
                        emailController.clear();
                        countryController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
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
                            color: AppColor.primaryColor1.withOpacity(1),
                          ),
                        ),
                        Text(
                          AppStrings.or,
                          style: TextStyle(
                            color: AppColor.primaryColor2,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppStrings.fontFamilyPoppins,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            color: AppColor.primaryColor1.withOpacity(1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.width * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //google register
                          },
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
                          onTap: () {
                            //facebook register
                          },
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
                          onTap: () {
                            //x register
                          },
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
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.alreadyHaveAccount,
                            style: TextStyle(
                              color: AppColor.primaryColor1,
                              fontSize: 14,
                              fontFamily: AppStrings.fontFamilyPoppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            AppStrings.login,
                            style: TextStyle(
                              color: AppColor.primaryColor2,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppStrings.fontFamilyPoppins,
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

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'fullName': fullNameController.value.text,
          'phoneNumber': phoneController.value.text,
          'email': emailController.value.text,
          'country': countryController.value.text,
          'password': passwordController.value.text,
          'confirmPassword': confirmPasswordController.value.text,
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'createdAt': DateTime.now(),
        })
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  Future<void> registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
  }
}

//act as expert flutter developer to enchance this code according to your requirements and needs for better performance and better user experience and make it a responsive widget with media query and make it change value when user select one value from drop menu and pass this value  text field to
