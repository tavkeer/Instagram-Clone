import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/profile/controller/profile_controller.dart';

class AppBarFloatingProfile extends StatelessWidget {
  const AppBarFloatingProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: true,
      actions: [
        const SizedBox(width: 10),
        Obx(
          () => DarkText(
            text: Get.find<ProfileController>().username.value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey.shade300,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.add_box_outlined,
          color: Colors.grey.shade300,
          size: 30,
        ),
        IconButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          icon: Icon(
            Icons.menu,
            color: Colors.grey.shade300,
            size: 35,
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
