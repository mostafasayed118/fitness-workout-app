import 'package:fitness_workout_app_1/core/cache/cache_helper.dart';
import 'package:fitness_workout_app_1/core/cubits/login_cubit/login_cubit_cubit.dart';
import 'package:fitness_workout_app_1/core/global_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // sl =>> service locator

void initServiceLoactor() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => GlobalBloc());
  sl.registerLazySingleton(() => LoginCubit());
}
