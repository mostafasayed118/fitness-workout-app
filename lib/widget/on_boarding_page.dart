import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pageObject;
  const OnBoardingPage({Key? key, required this.pageObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PageController controller = PageController();

    var media = MediaQuery.of(context).size;
    var imageWidth = media.width;
    var titleStyle = TextStyle(
      color: AppColor.primaryColor4,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      fontFamily: AppStrings.fontFamilyPoppins,
    );
    var subtitleStyle = TextStyle(
      color: AppColor.primaryColor1,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: AppStrings.fontFamilyHind,
    );

    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            pageObject['image'].toString(),
            width: imageWidth,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: imageWidth * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              // textAlign: TextAlign.center, // ask rahma for this feature
              pageObject['title'].toString(),
              style: titleStyle,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              // textAlign: TextAlign.center, // ask rahma for this feature
              pageObject['subtitle'].toString(),
              style: subtitleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
