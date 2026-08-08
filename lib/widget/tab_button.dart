import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isSelected;

  const TabButton({
    Key? key,
    required this.icon,
    required this.selectIcon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isSelected ? selectIcon : icon,
            width: isSmallScreen ? 20 : 25,
            height: isSmallScreen ? 24 : 29,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: isSelected ? 6 : 10),
          if (isSelected)
            Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColor.primaryG1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}
