import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class LoaderNew extends StatelessWidget {
  const LoaderNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor1),
        backgroundColor: AppColor.backgroundColor,
        strokeWidth: 5,
        semanticsLabel: 'Loading',
        semanticsValue: 'Loading',
        value: null,
        color: AppColor.primaryColor1,
      ),
    );
  }
}
