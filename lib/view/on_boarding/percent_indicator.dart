import 'package:fitness_workout_app_1/core/cache/cache_helper.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/home/home_view.dart';
import 'package:fitness_workout_app_1/view/on_boarding/started_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/services/service.locator.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool isCheck = false;

  @override
  void initState() {
    bool isVisted =
        sl<CacheHelper>().getData(key: AppStrings.onBoardingkey) ?? false;
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isVisted ? const HomeView() : const StartedView(),
        ),
      );
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isCheck = !isCheck;
              isCheck ? _controller.forward() : _controller.reverse();
            });
          },
          child: Lottie.asset(
            'assets/animation/animation_onboarding.json',
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
