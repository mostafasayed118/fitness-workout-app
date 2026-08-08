import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/view/calorie_estimation/cam_nav.dart';
import 'package:fitness_workout_app_1/view/home/home_view.dart';
import 'package:fitness_workout_app_1/view/profile/profile_view.dart';
import 'package:flutter/material.dart';

import '../../widget/tab_button.dart';
import 'select_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget curentTab = const HomeView();

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageStorage(bucket: pageBucket, child: curentTab),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColor.primaryG2,
              ),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2),
              ],
            ),
            child: Icon(Icons.search, size: 35, color: AppColor.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColor.white,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 2,
              ),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: AppAssets.homeTabIcon,
                selectIcon: AppAssets.homeActiveIcon,
                isSelected: selectTab == 0,
                onTap: () {
                  setState(() {
                    selectTab = 0;
                    curentTab = const HomeView();
                  });
                },
              ),
              TabButton(
                icon: AppAssets.activityTabIcon,
                selectIcon: AppAssets.activityActiveIcon,
                isSelected: selectTab == 1,
                onTap: () {
                  setState(() {
                    selectTab = 1;
                    curentTab = const SelectView();
                  });
                },
              ),
              const SizedBox(width: 40),
              TabButton(
                icon: AppAssets.cameraTabIcon,
                selectIcon: AppAssets.cameraActiveIcon,
                isSelected: selectTab == 2,
                onTap: () {
                  setState(() {
                    selectTab = 2;
                    curentTab = const CameraNavView();
                  });
                },
              ),
              TabButton(
                icon: AppAssets.profileTabIcon,
                selectIcon: AppAssets.profileIconActive,
                isSelected: selectTab == 3,
                onTap: () {
                  setState(() {
                    selectTab = 3;
                    curentTab = const ProfileView();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
