import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_workout_app_1/core/cache/cache_helper.dart';
import 'package:fitness_workout_app_1/core/cubits/login_cubit/login_cubit_cubit.dart';
import 'package:fitness_workout_app_1/core/data/repositories.authebtication/authentication_repository.dart';
import 'package:fitness_workout_app_1/core/global_bloc.dart';
import 'package:fitness_workout_app_1/core/services/service.locator.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/firebase_options.dart';
import 'package:fitness_workout_app_1/geminl_calories/new/bindings/app_binding.dart';
import 'package:fitness_workout_app_1/notification/local_notification_service.dart';
import 'package:fitness_workout_app_1/view/home/home_view.dart';
import 'package:fitness_workout_app_1/view/on_boarding/on_boarding_view.dart';
import 'package:fitness_workout_app_1/view/on_boarding/splash_view.dart';
import 'package:fitness_workout_app_1/view/on_boarding/started_view.dart';
import 'package:fitness_workout_app_1/view/reminder/home_page_reminder.dart';
import 'package:fitness_workout_app_1/view/reminder/new_entry/new_entry_page.dart';
import 'package:fitness_workout_app_1/view/reminder/success_screen/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Add local storage
  await GetStorage.init();

  //await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  initServiceLoactor();
  await sl<CacheHelper>().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  await LocalNotificationService.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<LoginCubit>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
          // initialBinding: GeneralBindings(),
          title: AppStrings.nutrifix,
          debugShowCheckedModeBanner: false,
          routes: {
            'splash': (context) => const SplashScreen(),
            'onBoarding': (context) => const OnBoardingView(),
            'started': (context) => const StartedView(),
            'home': (context) => const HomeView(),
            'newEntry': (context) => const NewEntryPage(),
            'success': (context) => const SuccessScreen(),
            'homeReminder': (context) => const HomePageReminder(),
          },
          initialRoute: 'splash',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: AppColor.primaryColor1,
            fontFamily: AppStrings.fontFamilyPoppins,
            scaffoldBackgroundColor: AppColor.backgroundColor,
            timePickerTheme: TimePickerThemeData(
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: AppColor.primaryColor1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: AppColor.primaryColor1,
                  ),
                ),
              ),
              dayPeriodShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColor.red, width: 2),
              ),
              hourMinuteShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              cancelButtonStyle: ButtonStyle(
                textStyle: WidgetStateProperty.all(
                  const TextStyle(
                    fontSize: 20,
                    fontFamily: AppStrings.fontFamilyPoppins,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                foregroundColor: WidgetStateProperty.all(AppColor.black),
              ),
              confirmButtonStyle: ButtonStyle(
                textStyle: WidgetStateProperty.all(
                  const TextStyle(
                    fontSize: 20,
                    fontFamily: AppStrings.fontFamilyPoppins,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                foregroundColor: WidgetStateProperty.all(AppColor.black),
              ),
              backgroundColor: AppColor.backgroundColor,
              dialHandColor: AppColor.primaryColor4,
              dialBackgroundColor: AppColor.backgroundColor,
              dayPeriodColor: AppColor.primaryColor4,
              hourMinuteColor: AppColor.backgroundColor,
              dayPeriodBorderSide: BorderSide(
                color: AppColor.primaryColor4,
                width: 2,
              ),
              dayPeriodTextColor: AppColor.black,
              hourMinuteTextColor: AppColor.primaryColor1,
              dayPeriodTextStyle: TextStyle(
                color: AppColor.primaryColor4,
                fontSize: 20,
                fontFamily: AppStrings.fontFamilyPoppins,
                fontWeight: FontWeight.w700,
              ),
              hourMinuteTextStyle: TextStyle(
                color: AppColor.red,
                fontSize: 27,
                fontFamily: AppStrings.fontFamilyPoppins,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          home: const SplashScreen(),
          initialBinding: AppBindingNew(),
        ),
      ),
    );
  }
}
