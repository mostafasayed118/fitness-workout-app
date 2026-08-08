import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

extension ResponsiveExtension on num {
  double get height => this * Device.height / 100;
  double get width => this * Device.width / 100;
}
