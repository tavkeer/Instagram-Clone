import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/home/home_page.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneBookAccessPage extends StatelessWidget {
  const PhoneBookAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //header
            const SizedBox(height: 50),
            const DarkText(
              textAlign: TextAlign.center,
              text:
                  "Next, you'll be able to sync your\ncontacts to find your friends.",
            ),

            const SizedBox(height: 50),
            const LightText(
              textAlign: TextAlign.center,
              text:
                  "if you allow Instagram to access your contacts, we will help you find people you know and help them find you, recommend things you care about and offer you a better service",
              textColor: Colors.grey,
            ),
            const SizedBox(height: 20),

            Image.asset(
              'assets/images/phonebook.png',
              height: 200,
              fit: BoxFit.cover,
            ),

            const Spacer(),

            const LightText(
              textAlign: TextAlign.center,
              text:
                  "if you allow Instagram to access your contacts, they will be Periodically synced, and securely stored on our servers. You can turn off syncing at any time in settings. Learn more.",
              textColor: Colors.grey,
            ),
            //button
            const SizedBox(height: 20),
            Button(
              text: 'Continue',
              controller: Get.find<SignUpController>().signUpLoading,
              borderRadius: 10,
              ontap: () => Get.off(() => const HomePage()),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
