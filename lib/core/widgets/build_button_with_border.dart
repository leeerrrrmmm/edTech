import 'package:flutter/material.dart';

class BuildButtonWithBorder extends StatelessWidget {
  final String? fontFamily;
  final double fontSize;
  final Color? color;
  final Color? textColor;
  final Color borderColor;
  final double borderWidth;
  final FontWeight fontWeight;
  final String text;
  final void Function() onTap;

  const BuildButtonWithBorder({
    super.key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    required this.borderColor,
    required this.borderWidth,
    this.color,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth),
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        width: double.infinity,
        height: 56,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
