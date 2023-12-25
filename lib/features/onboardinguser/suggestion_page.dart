import 'package:google_fonts/google_fonts.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/onboardinguser/contacts_access.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //header
            const SizedBox(height: 50),

            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.person_add_alt_outlined,
                  color: Colors.grey,
                  size: 100,
                ),
              ),
            ),

            //facebook mention
            const SizedBox(height: 20),
            const DarkText(text: "Get Facebook suggestions"),

            //details
            const SizedBox(height: 20),
            const LightText(
              text:
                  'You can find people you know from\nFacebook with Accounts Center',
              textAlign: TextAlign.center,
            ),

            //button
            const SizedBox(height: 60),
            Button(
              text: 'Continue',
              controller: Get.find<SignUpController>().signUpLoading,
              borderRadius: 15,
              ontap: () => Get.off(() => const PhoneBookAccessPage()),
            ),

            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Get.off(() => const PhoneBookAccessPage()),
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
