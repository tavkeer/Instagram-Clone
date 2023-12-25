import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta/widgets/loading.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  final dynamic controller;
  final double? borderRadius;

  const Button({
    super.key,
    required this.text,
    this.ontap,
    this.controller,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromRGBO(0, 149, 246, 1.0);
            }
            return const Color.fromRGBO(0, 149, 246, 1.0);
          },
        ),
      ),
      child: Obx(
        () => (controller.value ?? false)
            ? const Loading()
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
