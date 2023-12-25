import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta/features/auth/signup_page.dart';
import 'package:insta/widgets/hollow_button.dart';

class BrandingWidget extends StatelessWidget {
  const BrandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      children: [
        HollowButton(
          text: 'Create new Account',
          onTap: () => Get.to(() => const SignUpPage()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/meta.png',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  'Meta',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
