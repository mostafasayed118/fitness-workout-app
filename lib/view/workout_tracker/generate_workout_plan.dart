import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/home/blank_view.dart';
import 'package:fitness_workout_app_1/view/workout_tracker/workout_tracker_view.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/validators/validators.dart';
import '../../widget/normal_button.dart';
import '../../widget/round_textfield.dart';
import '../main_tab/select_view.dart';

class GenerateWorkoutPlan extends StatefulWidget {
  const GenerateWorkoutPlan({
    Key? key,
    required String titleText,
    required String subTitleText,
  }) : super(key: key);

  @override
  State<GenerateWorkoutPlan> createState() => _GenerateWorkoutPlanState();
}

class _GenerateWorkoutPlanState extends State<GenerateWorkoutPlan> {
  final generateWorkoutPlanKey = GlobalKey<FormState>();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final myGoalController = TextEditingController();
  final fitnessLevelController = TextEditingController();
  final daysController = TextEditingController();
  final hoursController = TextEditingController();
  final healthConditionController = TextEditingController();
  final routineController = TextEditingController();

  String? _selectedFitnessLevel;
  String? _selectedHealthCondition;
  String? _selectedRoutine;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var media = MediaQuery.of(context).size;
    final _itemsFitnessLevel = [
      "Beginner",
      'Intermediate',
      'Advanced',
      'Elite',
    ];
    final _itemsHealthCondition = [
      'Bulking Phase',
      'Cutting Phase',
      'Maintenance Phase',
      'lean Muscle Gain',
    ];
    final _itemsRoutine = [
      'Bro Split',
      'Push Pull Legs',
      'Upper and Lower',
      'Full Body',
    ];

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
                  return const WorkoutTrackerView();
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
          'Generate Workout Plan',
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
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
                // color: TColor.lightGray,
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
          horizontal: mediaQuery.size.width * 0.02,
        ),
        child: Form(
          key: generateWorkoutPlanKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    hitText: AppStrings.age,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    // maxLength: 2,
                    validator: (value) {
                      TextValidator.validateAge(value);
                      return null;
                    },
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
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
                          // maxLength: 3,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: AppColor.primaryG1),
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
                  SizedBox(height: mediaQuery.size.height * 0.015),
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
                          // maxLength: 3,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: AppColor.primaryG1),
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
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    hitText: 'My Goal',
                    iconPath: AppAssets.dateIcon,
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    // maxLength: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Goal is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                    hitText: 'Fitness Level',
                    controller: fitnessLevelController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedFitnessLevel,
                        items: _itemsFitnessLevel
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: AppColor.primaryColor1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              AppStrings.fontFamilyPoppins,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedFitnessLevel = newValue;
                            fitnessLevelController.text =
                                _selectedFitnessLevel ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    hitText: 'Days',
                    iconPath: AppAssets.leftArrowGrayIcon,
                    controller: daysController,
                    keyboardType: TextInputType.number,
                    // maxLength: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Days is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    hitText: 'Hours',
                    iconPath: AppAssets.leftArrowGrayIcon,
                    controller: hoursController,
                    keyboardType: TextInputType.number,
                    // maxLength: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Days is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                    hitText: 'Health Condition',
                    controller: healthConditionController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedHealthCondition,
                        items: _itemsHealthCondition
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: AppColor.primaryColor1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              AppStrings.fontFamilyPoppins,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedHealthCondition = newValue;
                            healthConditionController.text =
                                _selectedHealthCondition ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                    hitText: 'Routine',
                    controller: routineController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedRoutine,
                        items: _itemsRoutine
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: AppColor.primaryColor1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              AppStrings.fontFamilyPoppins,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRoutine = newValue;
                            routineController.text = _selectedRoutine ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  SizedBox(height: media.width * 0.05),
                  NormalButton(
                    textColor: AppColor.white,
                    text: AppStrings.confirm,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BlankView(),
                        ),
                      );
                    },
                    backgroundColor: AppColor.primaryColor1,
                    widthSize: 330,
                    heightSize: 61,
                    borderColor: AppColor.primaryColor1,
                    fontSize: 32,
                  ),
                  SizedBox(height: media.width * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
