import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? textColor;
  final String? fontfamily;
  const LightText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
    this.textAlign,
    this.textColor,
    this.fontfamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: size ?? 15,
        fontFamily: fontfamily ?? GoogleFonts.poppins().fontFamily,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 1.5,
      ),
    );
  }
}
