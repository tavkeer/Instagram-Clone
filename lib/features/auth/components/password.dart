import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/components/textfield.dart';
import 'package:insta/features/auth/utils/hidepassword_icon.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Password extends StatelessWidget {
  const Password({
    super.key,
    required this.pageController,
    required this.password,
  });

  final PageController pageController;

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DarkText(text: "Create a password"),
          const LightText(
            text:
                "Create a strong Password with at least 6 letters or numbers. It should be something that others can't guess",
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextFieldWidget(
              hint: 'Password',
              controller: password,
              trailing: const HidePasswordIcon(),
              hidePassword: Get.find<SignUpController>().hidePassword.value,
              inputType: TextInputType.name,
              onCheckName: (name) {},
            ),
          ),
          const SizedBox(height: 15),
          Button(
            text: 'Next',
            ontap: () => nextButtonPressed(password.text),
            controller: Get.find<SignUpController>().signUpLoading,
          ),
        ],
      ),
    );
  }

  void nextButtonPressed(String text) {
    if (text.length > 5) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
