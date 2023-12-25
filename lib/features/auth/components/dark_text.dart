import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkText extends StatelessWidget {
  final String text;
  final double? size;
  final TextAlign? textAlign;
  const DarkText({
    super.key,
    required this.text,
    this.size,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontSize: size ?? 25,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: FontWeight.bold,
        height: 1.5,
      ),
    );
  }
}
