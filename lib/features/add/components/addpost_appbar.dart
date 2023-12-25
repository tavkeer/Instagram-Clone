import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:insta/features/add/components/addpost_details.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/light_text.dart';

class AddPostAppBar extends StatelessWidget {
  const AddPostAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        const Center(child: DarkText(text: 'New Post')),
        const Spacer(),
        Center(
          child: GestureDetector(
            onTap: () => Get.to(() => const AddPostDetails()),
            child: const LightText(
              text: 'Next',
              textColor: Colors.blue,
              fontWeight: FontWeight.bold,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
