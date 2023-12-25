import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/components/textfield.dart';
import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/widgets/button.dart';

class Email extends StatelessWidget {
  const Email({
    super.key,
    required this.pageController,
    required this.email,
    required this.ontap,
  });
  final PageController pageController;
  final void Function()? ontap;

  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DarkText(text: "What's your email address?"),
          const LightText(
            text:
                "Enter the email on whick you can be contacted. No one will see this on your profile",
          ),
          const SizedBox(height: 15),
          TextFieldWidget(
            hint: 'Email Address',
            controller: email,
            trailing: const SizedBox.shrink(),
            hidePassword: false,
            inputType: TextInputType.emailAddress,
            onCheckName: (name) {},
          ),
          const SizedBox(height: 15),
          Button(
            text: 'Next',
            ontap: ontap,
            controller: Get.find<SignUpController>().signUpLoading,
          ),
        ],
      ),
    );
  }
}
