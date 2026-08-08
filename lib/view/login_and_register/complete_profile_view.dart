import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/core/utils/validators/validators.dart';
import 'package:fitness_workout_app_1/view/login_and_register/what_your_goal_view.dart';
import 'package:flutter/material.dart';

import '../../widget/normal_button.dart';
import '../../widget/round_textfield.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({Key? key}) : super(key: key);

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final completeFormKey = GlobalKey<FormState>();
  final dateOfBirthController = TextEditingController();
  final genderController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String? _selectedGender;

  CollectionReference usersExtraInfo = FirebaseFirestore.instance.collection(
    'usersExtraInfo',
  );

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var _selected = 0;
    final _itemsGender = ["Male", 'Female'];
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  AppStrings.completeProfileTitle,
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
                Text(
                  AppStrings.completeProfileSubTitle,
                  style: TextStyle(
                    color: AppColor.primaryColor2,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Image.asset(
                  AppAssets.completeProfile,
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: completeFormKey,
                    child: Column(
                      children: [
                        RoundTextfield(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Date is required';
                            }
                            return null;
                          },
                          hitText: AppStrings.chooseGenderHint,
                          controller: genderController,
                          iconPath: AppAssets.genderIcon,
                          rightIcon: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: AppColor.primaryColor1,
                              dropdownColor: AppColor.backgroundColor,
                              value: _selectedGender,
                              items: _itemsGender
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Row(
                                        children: [
                                          value == 'Male'
                                              ? Image.asset(
                                                  AppAssets.maleIcon,
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                )
                                              : Image.asset(
                                                  AppAssets.womanIcon,
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                ),
                                          const SizedBox(width: 8),
                                          Text(
                                            value,
                                            style: TextStyle(
                                              color: AppColor.gray,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  AppStrings.fontFamilyPoppins,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedGender = newValue;
                                  genderController.text = _selectedGender ?? '';
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: media.width * 0.05),
                        RoundTextfield(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Date is required';
                            }
                            return null;
                          },
                          hitText: AppStrings.dateOfBirthHint,
                          controller: dateOfBirthController,
                          iconPath: AppAssets.dateIcon,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: media.width * 0.05),
                        Row(
                          children: [
                            Expanded(
                              child: RoundTextfield(
                                validator: (value) {
                                  TextValidator.validateWeight(value);
                                  return null;
                                },
                                hitText: AppStrings.weightHint,
                                iconPath: AppAssets.weightIcon,
                                controller: weightController,
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: AppColor.primaryG1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                AppStrings.kg,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 12,
                                  fontFamily: AppStrings.fontFamilyHind,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: media.width * 0.05),
                        Row(
                          children: [
                            Expanded(
                              child: RoundTextfield(
                                validator: (value) {
                                  TextValidator.validateHeight(value);
                                  return null;
                                },
                                hitText: AppStrings.heightHint,
                                controller: heightController,
                                iconPath: AppAssets.heightIcon,
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: AppColor.primaryG1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                AppStrings.cm,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 12,
                                  fontFamily: AppStrings.fontFamilyHind,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: media.width * 0.07),
                        NormalButton(
                          textColor: AppColor.white,
                          text: AppStrings.next,
                          onPressed: () {
                            addUserExtraInfo();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WhatYourGoalView(),
                              ),
                            );
                          },
                          backgroundColor: AppColor.primaryColor1,
                          widthSize: 330,
                          heightSize: 61,
                          borderColor: AppColor.primaryColor1,
                          fontSize: 30,
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

  Future<void> addUserExtraInfo() {
    // Call the user's CollectionReference to add a new user
    return usersExtraInfo.add({
      'dateOfBirth': dateOfBirthController.value.text,
      'weight': weightController.value.text,
      'height': heightController.value.text,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'createdAt': DateTime.now(),
    });
  }
}
