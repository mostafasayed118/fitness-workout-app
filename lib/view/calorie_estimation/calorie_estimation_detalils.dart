import 'dart:developer';
import 'dart:io';

import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tflite_v2/tflite_v2.dart'; // Removed - incompatible with AGP 8.x

import '../../core/utils/app_colors.dart';
import '../main_tab/main_tab_view.dart';
import '../main_tab/select_view.dart';

class CalorieEstimationDetails extends StatefulWidget {
  const CalorieEstimationDetails({Key? key}) : super(key: key);

  @override
  State<CalorieEstimationDetails> createState() =>
      _CalorieEstimationDetailsState();
}

class _CalorieEstimationDetailsState extends State<CalorieEstimationDetails> {
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

  Future detectimage(File image) async {
    // TFLite inference removed - incompatible with AGP 8.x
    // TODO: Replace with alternative TFLite package
    setState(() {
      _recognitions = [];
      v = '[]';
    });
    log(_recognitions.toString());
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainTabView();
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
          AppStrings.details,
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
        child: Column(
          children: [
            Text(v),
            SizedBox(height: mediaQuery.size.height * 0.015),
          ],
        ),
      ),
    );
  }
}
