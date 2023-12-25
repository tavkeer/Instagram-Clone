import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HidePasswordIcon extends StatelessWidget {
  const HidePasswordIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.find<SignUpController>().togglePassword,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Obx(
          () => (Get.find<SignUpController>().hidePassword.value)
              ? Icon(
                  Icons.visibility_off,
                  color: Colors.grey.shade400,
                )
              : Icon(
                  Icons.visibility,
                  color: Colors.grey.shade400,
                ),
        ),
      ),
    );
  }
}
