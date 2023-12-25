import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/auth/utils/loading_indicator.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/textfield.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.pageController,
    required this.userName,
  });

  final PageController pageController;
  final TextEditingController userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DarkText(text: "Create a username"),
          const LightText(
            text:
                "Add a username or use our suggestion. You can change this at any time.",
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextFieldWidget(
              hint: 'Username',
              controller: userName,
              trailing: Get.find<SignUpController>().userNameExists.value
                  ? LoadingIndicator(
                      controller: Get.find<SignUpController>().userNameLoading,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.green),
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 10),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ),
              hidePassword: false,
              inputType: TextInputType.name,
              onCheckName: (name) =>
                  Get.find<SignUpController>().checkIfDocumentExists(name),
            ),
          ),
          const SizedBox(height: 15),
          Button(
            text: 'Next',
            ontap: () => nextButtonPressed(userName.text),
            controller: Get.find<SignUpController>().signUpLoading,
          ),
        ],
      ),
    );
  }

  Widget getTrailingWidget() {
    return !Get.find<SignUpController>().userNameExists.value
        ? const Icon(
            Icons.done,
            color: Colors.green,
          )
        : LoadingIndicator(
            controller: Get.find<SignUpController>().userNameLoading,
          );
  }

  void nextButtonPressed(String text) {
    if (text.isNotEmpty && !Get.find<SignUpController>().userNameExists.value) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
