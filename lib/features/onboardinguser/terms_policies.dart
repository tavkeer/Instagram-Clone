import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/onboardinguser/add_profile_pic.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/widgets/auth_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndPolicies extends StatelessWidget {
  const TermsAndPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      backButton: false,
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //header
            const DarkText(
              text: "Agree to Instagram's terms and policies",
            ),
            const SizedBox(height: 10),

            //learn more
            RichText(
              text: TextSpan(
                text:
                    "People who use our services may have uploaded your contact information to Instagram. ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            //term and cookie poclicy
            RichText(
              text: TextSpan(
                text:
                    "By tapping I agree. you agree to create an account and to instagram's ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Term, Privacy Policy ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "Cookie Policy ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            //privacy policy
            RichText(
              text: TextSpan(
                text: "The ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Privacy Policy ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        "describe the way we can use the information. We collect when you create an account. For example, we use this information to provide, personalise and improve our products, including ads.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            //button
            const SizedBox(height: 10),
            Button(
              text: 'I Agree',
              controller: Get.find<SignUpController>().signUpLoading,
              ontap: () => Get.off(() => const AddProfilePicture()),
            )
          ],
        ),
      ),
    );
  }
}
