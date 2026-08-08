import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_workout_app_1/view/login_and_register/login_view.dart';
import 'package:fitness_workout_app_1/view/on_boarding/splash_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show the splash screen
  screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(const LoginView())
        : Get.offAll(const SplashScreen());
  }

  // EmailAuthentication -> Register

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      throw 'Error: ${e.toString()}';
    }
  }
}
