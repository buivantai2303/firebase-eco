import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    Key? key, // Added Key parameter here
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    required this.color,
    this.backgroundColor,
  }) : super(key: key); // Passed the key parameter to super constructor

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: backgroundColor != null
          ? backgroundColor!
          : THelperFunctions.isDarkMode(context)
              ? TColors.black.withOpacity(0.9)
              : TColors.white.withOpacity(0.9),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
