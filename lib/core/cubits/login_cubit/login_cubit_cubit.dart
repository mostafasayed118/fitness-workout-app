import 'package:fitness_workout_app_1/core/cubits/login_cubit/login_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginCubitInitial());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  bool hidePassword = true;
  // TextEditingController fullNameController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController countryController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconData suffixIcon = Icons.visibility;

  void changePasswordVisibility() {
    hidePassword = !hidePassword;
    suffixIcon = hidePassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }
}
