import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';

class AnimatedNumericText extends StatelessWidget {
  AnimatedNumericText({
    Key? key,
    required this.initialValue,
    required this.targetValue,
    required this.controller,
    required this.text,
    this.curve = Curves.linear,
  })  : numberAnimation = Tween<double>(
          begin: initialValue,
          end: targetValue,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: curve,
        )),
        super(key: key);

  final double initialValue;
  final double targetValue;
  final String text;
  final AnimationController controller;
  final Curve curve;
  final Animation<double> numberAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: numberAnimation,
      builder: (context, child) => Text(
        text,
        style: TextStyle(
          fontSize: numberAnimation.value,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          color: AppTheme.darkText,
        ),
      ),
    );
  }
}
