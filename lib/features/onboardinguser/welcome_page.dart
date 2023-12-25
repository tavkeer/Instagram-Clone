import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/onboardinguser/controllers/onboarding_controller.dart';
import 'package:insta/features/onboardinguser/suggestion_page.dart';
import 'package:insta/widgets/auth_template.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      backButton: false,
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //header

            //button
            const SizedBox(height: 50),

            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.grey,
                size: 150,
              ),
            ),

            //username mention
            const SizedBox(height: 20),
            Obx(
              () => LightText(
                text:
                    'Welcome to Instagram, ${Get.find<OnBoardingController>().userName.value}',
                fontWeight: FontWeight.bold,
              ),
            ),

            //welcome note
            const LightText(text: "Let's start customising your experience"),
            const Spacer(),

            Button(
              text: 'Next',
              controller: Get.find<SignUpController>().signUpLoading,
              ontap: () => Get.off(() => const SuggestionPage()),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
