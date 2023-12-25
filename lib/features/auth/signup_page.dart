import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/auth/components/dateof_birth.dart';
import 'package:insta/features/auth/components/password.dart';
import 'package:insta/features/auth/components/username.dart';
import 'package:insta/features/auth/components/email.dart';
import 'package:insta/widgets/auth_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    //initialize controller
    Get.put(SignUpController());

    //pagecontroller
    final PageController pageController = PageController();

    //password controller
    final TextEditingController password = TextEditingController();

    //DOB controller
    final TextEditingController dob = TextEditingController();

    //username controller
    final TextEditingController userName = TextEditingController();

    //email controller
    final TextEditingController email = TextEditingController();

    //key
    final GlobalKey key = GlobalKey();

    //register user
    registerUser() {
      Get.find<SignUpController>().registerUser(
        email: email.text.trim(),
        password: password.text.trim(),
        userName: userName.text.trim(),
        dob: dob.text.trim(),
      );
    }

    //body
    return AuthTemplate(
      pageController: pageController,
      child: SafeArea(
        child: PageView(
          key: key,
          physics: const NeverScrollableScrollPhysics(),
          reverse: false,
          controller: pageController,
          children: [
            Password(pageController: pageController, password: password),
            DateOfBirth(pageController: pageController, dob: dob),
            UserName(pageController: pageController, userName: userName),
            Email(
              pageController: pageController,
              email: email,
              ontap: registerUser,
            ),
          ],
        ),
      ),
    );
  }
}
