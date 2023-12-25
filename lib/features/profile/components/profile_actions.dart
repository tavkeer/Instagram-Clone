import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: SizedBox(
          width: Get.width,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonTemplete(
                text: 'Edit Profile',
              ),
              SizedBox(width: 10),
              ButtonTemplete(
                text: "Share Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonTemplete extends StatelessWidget {
  final void Function()? ontap;
  final String text;

  const ButtonTemplete({super.key, this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xDF424242);
              }
              return const Color(0xDF424242);
            },
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
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
