import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_workout_app_1/core/helper/show_snack_bar.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/view/login_and_register/login_view.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:flutter/material.dart';

import '../widget/round_textfield.dart';

class PasswordForgetEmailPage extends StatefulWidget {
  const PasswordForgetEmailPage({super.key});

  @override
  State<PasswordForgetEmailPage> createState() =>
      _PasswordForgetEmailPageState();
}

class _PasswordForgetEmailPageState extends State<PasswordForgetEmailPage> {
  //############ password forget page one API ########################
  final _emailController = TextEditingController();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordRest() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No user found for that email.',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }
    showSnackBar(context, ' Check your email', AppColor.primaryColor1);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: media.width * 0.01),
                Image.asset(
                  'assets/images/openlock.png',
                  width: media.width * 0.4,
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: resetPasswordFormKey,
                    child: Column(
                      children: [
                        Text(
                          "Please Enter Your Email Address To Send A Password Reset Link",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.primaryColor1,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Khand',
                          ),
                        ),
                        SizedBox(height: media.width * 0.08),
                        RoundTextfield(
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                            return null;
                          },
                          hitText: 'Enter Your Email',
                          iconPath: AppAssets.emailIcon,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: media.width * 0.3),
                        NormalButton(
                          textColor: AppColor.primaryColor1,
                          text: 'Send',
                          onPressed: () {
                            if (resetPasswordFormKey.currentState!.validate()) {
                              passwordRest();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ),
                              );
                            } else {
                              showSnackBar(
                                context,
                                'Enter Valid Email',
                                AppColor.red,
                              );
                            }
                          },
                          backgroundColor: AppColor.white,
                          widthSize: 330,
                          heightSize: 50,
                          borderColor: AppColor.primaryColor1,
                          fontSize: 32,
                        ),
                      ],
                    ),
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
