import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/textfield.dart';
import 'package:insta/features/auth/controller/login_controller.dart';
import 'package:insta/widgets/button.dart';

class LoginForm extends StatelessWidget {
  //login credentials
  final TextEditingController username;

  //password for login
  final TextEditingController password;
  const LoginForm({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      alignment: WrapAlignment.center,
      children: [
        TextFieldWidget(
          hint: 'Username or email address',
          controller: username,
          trailing: const SizedBox.shrink(),
          hidePassword: false,
          inputType: TextInputType.emailAddress,
          onCheckName: (value) {},
        ),
        TextFieldWidget(
          hint: 'Password',
          controller: password,
          trailing: const SizedBox.shrink(),
          hidePassword: true,
          inputType: TextInputType.name,
          onCheckName: (value) {},
        ),
        Button(
          text: 'Log In',
          ontap: () {
            Get.find<LoginController>().login(
              email: username.text.trim(),
              password: password.text.trim(),
            );
          },
          controller: Get.find<LoginController>().loginLoading,
        ),
        const DarkText(
          text: 'Forgotten Password?',
          size: 16,
        )
      ],
    );
  }
}
