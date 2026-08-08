import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          showAction
              ? SizedBox(
                  height: 200,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    child: Text(actionText!),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
