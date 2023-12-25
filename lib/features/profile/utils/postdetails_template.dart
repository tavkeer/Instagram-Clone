import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/features/auth/components/light_text.dart';

class PostDetailsTemplate extends StatelessWidget {
  final dynamic controller;
  final String text;
  const PostDetailsTemplate(
      {super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => LightText(
              text: controller.value,
              fontWeight: FontWeight.bold,
            )),
        LightText(
          text: text,
          fontWeight: FontWeight.bold,
          size: 14,
        ),
      ],
    );
  }
}
