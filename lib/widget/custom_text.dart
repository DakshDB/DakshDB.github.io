import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color color;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      required this.text,
      required this.textSize,
      required this.color,
      this.letterSpacing,
      this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: textSize,
          letterSpacing: letterSpacing ?? 0.10,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
