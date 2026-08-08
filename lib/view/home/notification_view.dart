import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/notification/local_notification_service.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../widget/notification_row.dart';
import '../main_tab/select_view.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<Map<String, String>> notificationArr = [
    {
      "image": "assets/images/not_3.png",
      "title": "Hey, it's time for lunch",
      "time": "About 1 minutes ago",
    },
    {
      "image": "assets/images/Workout_2.png",
      "title": "Don't miss your lower body workout",
      "time": "About 3 hours ago",
    },
    {
      "image": "assets/images/not_2.png",
      "title": "Hey, let's add some meals for your b",
      "time": "About 3 hours ago",
    },
    {
      "image": "assets/images/Workout_3.png",
      "title": "Congratulations, You have finished A..",
      "time": "29 May",
    },
    {
      "image": "assets/images/not_1.png",
      "title": "Hey, it's time for lunch",
      "time": "8 April",
    },
    {
      "image": "assets/images/Workout_2.png",
      "title": "Ups, You have missed your Lower bo...",
      "time": "8 April",
    },
  ];

  void listenToNotificationStream() {
    LocalNotificationService.streamController.stream.listen((event) {
      setState(() {});
    });
  }

  @override
  void initState() {
    listenToNotificationStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: screenWidth * 0.1,
            width: screenWidth * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            child: Image.asset(
              AppAssets.leftArrowIcon,
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          AppStrings.notification,
          style: TextStyle(
            color: AppColor.black,
            fontSize: screenWidth * 0.05,
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
              height: screenWidth * 0.1,
              width: screenWidth * 0.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
              child: Image.asset(
                AppAssets.twoDotsIcon,
                width: screenWidth * 0.08,
                height: screenWidth * 0.08,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      // backgroundColor: AppColor.white,
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.05,
        ),
        itemBuilder: (context, index) {
          var nObj = notificationArr[index];
          return NotificationRow(nObj: nObj);
        },
        separatorBuilder: (context, index) {
          return Divider(color: AppColor.gray.withOpacity(0.5), height: 1);
        },
        itemCount: notificationArr.length,
      ),
    );
  }
}
