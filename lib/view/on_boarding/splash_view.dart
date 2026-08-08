import 'dart:async';

import 'package:fitness_workout_app_1/core/cache/cache_helper.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/login_and_register/login_view.dart';
import 'package:fitness_workout_app_1/view/on_boarding/started_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../core/services/service.locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Timer(const Duration(milliseconds: 2000), () {
      FlutterNativeSplash.remove();
      if (!mounted) return;
      bool isVisited =
          sl<CacheHelper>().getData(key: AppStrings.onBoardingkey) ?? false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isVisited ? const LoginView() : const StartedView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final logoSize = mediaQuery.size.width * 0.6;

    return Scaffold(
      backgroundColor: const Color(0xff0a5a6a),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset(
            AppAssets.logoSplash,
            width: logoSize,
            height: logoSize,
          ),
        ),
      ),
    );
  }
}
