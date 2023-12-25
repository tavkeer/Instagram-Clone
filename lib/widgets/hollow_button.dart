import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HollowButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color? borderColor;
  final Color? textColor;

  const HollowButton({
    Key? key,
    required this.text,
    this.onTap,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
              color: borderColor ?? const Color.fromRGBO(0, 149, 246, 1.0),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.transparent;
          },
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 1.2,
              color: textColor ?? const Color.fromRGBO(0, 149, 246, 1.0),
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
