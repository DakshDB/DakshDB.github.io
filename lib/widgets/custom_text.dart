import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color color;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? height;

  const CustomText({
    super.key,
    required this.text,
    required this.textSize,
    required this.color,
    this.letterSpacing,
    this.fontWeight,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: textSize,
        letterSpacing: letterSpacing ?? 0.10,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height,
      ),
    );
  }
}
