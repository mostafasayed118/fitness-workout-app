import 'dart:developer';
import 'dart:io';

import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/widget/normal_button.dart';
import 'package:fitness_workout_app_1/widget/nutritions_row.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tflite_v2/tflite_v2.dart'; // Removed - incompatible with AGP 8.x

import '../../core/utils/app_colors.dart';
import '../main_tab/select_view.dart';

class CaloriesEstimationScan extends StatefulWidget {
  const CaloriesEstimationScan({super.key});

  @override
  State<CaloriesEstimationScan> createState() => _CaloriesEstimationScanState();
}

class _CaloriesEstimationScanState extends State<CaloriesEstimationScan> {
  List nutritionArr = [
    {
      "title": "Calories",
      "image": "assets/images/burn.png",
      "unit_name": "kCal",
      "value": "350",
      "max_value": "500",
    },
    {
      "title": "Proteins",
      "image": "assets/images/proteins.png",
      "unit_name": "g",
      "value": "300",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": "assets/images/egg.png",
      "unit_name": "g",
      "value": "250",
      "max_value": "1000",
    },
    {
      "title": "Carbo",
      "image": "assets/images/carbo.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
  ];
  List nutritionArrOfZero = [
    {
      "title": "Calories",
      "image": "assets/images/burn.png",
      "unit_name": "kCal",
      "value": "0",
      "max_value": "500",
    },
    {
      "title": "Proteins",
      "image": "assets/images/proteins.png",
      "unit_name": "g",
      "value": "0",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": "assets/images/egg.png",
      "unit_name": "g",
      "value": "0",
      "max_value": "1000",
    },
    {
      "title": "Carbo",
      "image": "assets/images/carbo.png",
      "unit_name": "g",
      "value": "0",
      "max_value": "1000",
    },
  ];
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  List? _recognitions;
  var v = "";
  // var dataList = [];
  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    // TFLite model loading removed - incompatible with AGP 8.x
    // TODO: Replace with alternative TFLite package
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      log('Error picking image: $e');
    }
  }

  Future detectimage(File image) async {
    // TFLite inference removed - incompatible with AGP 8.x
    // TODO: Replace with alternative TFLite package
    setState(() {
      _recognitions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

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
        title: Text(
          AppStrings.scan,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mediaQuery.size.height * 0.05,
              horizontal: mediaQuery.size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_image != null)
                  Image.file(
                    File(_image!.path),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                else
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Steps To Use Scan Food :-',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.fontFamilyPoppins,
                            color: AppColor.primaryColor4,
                          ),
                        ),
                        SizedBox(height: mediaQuery.size.height * 0.03),
                        Text(
                          ' 1-Click On Scan button ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.fontFamilyPoppins,
                            color: AppColor.primaryColor1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: mediaQuery.size.height * 0.03),
                        Text(
                          ' 2-Pick An Image to Identify From Gallery or Camera',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.fontFamilyPoppins,
                            color: AppColor.primaryColor1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                Text(
                  // v != "[]" ? _recognitions![0]['label'] : 'No Food Detected',
                  v,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
                SizedBox(height: mediaQuery.size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Food Nutrition",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppStrings.fontFamilyPoppins,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: nutritionArr.length,
                  itemBuilder: (context, index) {
                    var nObj = nutritionArrOfZero[index] as Map? ?? {};

                    return NutritionRow(nObj: nObj);
                  },
                ),
                SizedBox(height: mediaQuery.size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: InkWell(
      //   onTap: _pickImage,
      //   child: Container(
      //     padding: const EdgeInsets.all(10),
      //     width: mediaQuery.size.width * 0.15,
      //     height: mediaQuery.size.width * 0.15,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: AppColor.primaryG1,
      //         end: Alignment.topCenter,
      //         begin: Alignment.bottomCenter,
      //       ),
      //       borderRadius: BorderRadius.circular(mediaQuery.size.width * 0.075),
      //       boxShadow: const [
      //         BoxShadow(
      //           color: Colors.black12,
      //           blurRadius: 5,
      //           offset: Offset(0, 2),
      //         ),
      //       ],
      //     ),
      //     alignment: Alignment.center,
      //     child: Image.asset(
      //       AppAssets.galleryIcon,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NormalButton(
            textColor: AppColor.primaryColor1,
            text: AppStrings.scan,
            onPressed: () {
              _pickImage();
              nutritionArrOfZero = nutritionArr;
            },
            backgroundColor: AppColor.white,
            widthSize: mediaQuery.size.width * 0.9,
            heightSize: mediaQuery.size.height * 0.08,
            borderColor: AppColor.primaryColor1,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// act as expert flutter developer to implement this code to make it when user click on scan button it should open camera or gallery and when user select image it should show image in image view and show the food name and nutrition value in the below listview and if user click on any item in listview it should show the detail of that item in new screen
