import 'package:fitness_workout_app_1/core/utils/Colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    background: LBgColor,
    primary: LPrimaryColor,
    onBackground: LFontColor,
    primaryContainer: LDivColor,
    onPrimaryContainer: LFontColor,
    onSecondaryContainer: LLableColor,
  ),
);
