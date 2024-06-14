import 'package:flutter/material.dart';

class PolicyText extends StatelessWidget {
  const PolicyText({
    super.key,
    required this.title,
    required this.textColor,
  });

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: textColor,
        ),
      ),
    );
  }
}
