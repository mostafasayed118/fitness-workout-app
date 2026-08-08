import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/meal_planner/meal_planner_view.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/validators/validators.dart';
import '../../geminl_meal/new/views/home_page_meal.dart';
import '../../widget/normal_button.dart';
import '../../widget/round_textfield.dart';
import '../main_tab/select_view.dart';

class GenerateMealPlan extends StatefulWidget {
  const GenerateMealPlan({
    Key? key,
    required String titleText,
    required String subTitleText,
  }) : super(key: key);

  @override
  State<GenerateMealPlan> createState() => _GenerateMealPlanState();
}

class _GenerateMealPlanState extends State<GenerateMealPlan> {
  final generateMealPlanKey = GlobalKey<FormState>();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final genderController = TextEditingController();
  final activityLevelController = TextEditingController();
  final medicalConditionController = TextEditingController();
  final allergieController = TextEditingController();
  final medicationController = TextEditingController();
  final fitnessGoalController = TextEditingController();
  final stressLevelController = TextEditingController();
  final sleepPatternController = TextEditingController();
  final smokerController = TextEditingController();
  final alcoholController = TextEditingController();

  String? _selectedGender;
  String? _selectedActivityLevel;
  String? _selectedMedicalCondition;
  String? _selectedAllergie;
  String? _selectedFitnessGoal;
  String? _selectedStressLevel;
  String? _selectedSleepPattern;
  String? _selectedSmoker;
  String? _selectedAlcohol;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var media = MediaQuery.of(context).size;
    final _itemsGender = ["Male", 'Female'];
    final _itemsActivityLevel = [
      'Sedentary',
      'Lightly Active',
      'Moderately Active',
      'Very Active',
      'Extremely Active',
    ];
    final _itemsMedicalCondition = [
      'Diabetes',
      'Hypertension',
      'Habitat',
      'Celiac Disease',
      'Irritable Bowel Syndrome',
      'Other',
      'None',
    ];
    final _itemsAllergie = [
      'Gluten',
      'Lactose',
      'Nuts',
      'Shellfish',
      'Soy',
      'Other'
          'None',
    ];
    final _itemsFitnessGoal = [
      'Lose Weight',
      'Maintain Weight',
      'Muscle Gain',
      'Endurance Improvement',
      'Overall Health Maintenance',
      'Flexibility and Mobility',
    ];
    final _itemsStressLevel = [
      'Low',
      'Moderate',
      'High',
      'Very High',
      'Not Sure/Varies',
    ];
    final _itemsSleepPattern = ['Excellent', 'Good', 'Fair', 'Poor', 'Varied'];
    final _itemsSmoker = [
      'Noon-smoker',
      'Occasional smoker',
      'Regular smoker',
      'Former smoker',
      'Heavy smoker',
    ];
    final _itemsAlcohol = [
      'Non drinker',
      'Occasional drinker',
      'Moderate drinker',
      'Regular drinker',
      'Heavy drinker',
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
                  return const MealPlannerView();
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
          'Generate Meal Plan',
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
          key: generateMealPlanKey,
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
                        alignment: Alignment.center,
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
                                        fontSize: 12,
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
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                    hitText: 'Activity Level',
                    controller: activityLevelController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedActivityLevel,
                        items: _itemsActivityLevel
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
                                          fontSize: 12,
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
                            _selectedActivityLevel = newValue;
                            activityLevelController.text =
                                _selectedActivityLevel ?? '';
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
                    hitText: 'Medical Condition',
                    controller: medicalConditionController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedMedicalCondition,
                        items: _itemsMedicalCondition
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
                                          fontSize: 12,
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
                            _selectedMedicalCondition = newValue;
                            medicalConditionController.text =
                                _selectedMedicalCondition ?? '';
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
                    hitText: 'Allergie',
                    controller: allergieController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedAllergie,
                        items: _itemsAllergie
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
                                          fontSize: 12,
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
                            _selectedAllergie = newValue;
                            allergieController.text = _selectedAllergie ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.015),
                  RoundTextfield(
                    hitText: 'Medication',
                    iconPath: AppAssets.leftArrowGrayIcon,
                    controller: medicationController,
                    keyboardType: TextInputType.number,
                    // maxLength: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
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
                    hitText: 'Fitness Goal',
                    controller: fitnessGoalController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedFitnessGoal,
                        items: _itemsFitnessGoal
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
                                          fontSize: 12,
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
                            _selectedFitnessGoal = newValue;
                            fitnessGoalController.text =
                                _selectedFitnessGoal ?? '';
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
                    hitText: 'Stress Level',
                    controller: stressLevelController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedStressLevel,
                        items: _itemsStressLevel
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
                                          fontSize: 12,
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
                            _selectedStressLevel = newValue;
                            stressLevelController.text =
                                _selectedStressLevel ?? '';
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
                    hitText: 'Sleep Pattern',
                    controller: sleepPatternController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedSleepPattern,
                        items: _itemsSleepPattern
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
                                          fontSize: 12,
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
                            _selectedSleepPattern = newValue;
                            sleepPatternController.text =
                                _selectedSleepPattern ?? '';
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
                    hitText: 'Smoker Status',
                    controller: smokerController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedSmoker,
                        items: _itemsSmoker
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
                                          fontSize: 12,
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
                            _selectedSmoker = newValue;
                            smokerController.text = _selectedSmoker ?? '';
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
                    hitText: 'Alcohol Status',
                    controller: alcoholController,
                    iconPath: AppAssets.leftArrowGrayIcon,
                    rightIcon: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconEnabledColor: AppColor.primaryColor1,
                        dropdownColor: AppColor.backgroundColor,
                        value: _selectedAlcohol,
                        items: _itemsAlcohol
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
                                          fontSize: 12,
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
                            _selectedAlcohol = newValue;
                            alcoholController.text = _selectedAlcohol ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: media.width * 0.05),
                  NormalButton(
                    textColor: AppColor.white,
                    text: AppStrings.confirm,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MealHomePage(),
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
