import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/controller/login_controller.dart';
import 'package:insta/features/auth/utils/branding_widget.dart';
import 'package:insta/features/auth/utils/login_form.dart';
import 'package:insta/widgets/auth_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //login credentials
    final TextEditingController userName = TextEditingController();

    //password for login
    final TextEditingController password = TextEditingController();

    //initialize controller
    Get.put(LoginController());

    return AuthTemplate(
      backButton: false,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //language used
              const LightText(
                text: 'English(India)',
                size: 13,
              ),
              const SizedBox(height: 15),

              //logo desing
              Image.asset(
                'assets/images/instagram_logo.png',
                height: 60,
                width: 60,
              ),
              const SizedBox(height: 15),

              //Input form for login
              LoginForm(username: userName, password: password),
              const SizedBox(height: 15),

              //create account navigate and branding
              const BrandingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
