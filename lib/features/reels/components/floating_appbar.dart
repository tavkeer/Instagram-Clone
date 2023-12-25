import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta/features/auth/components/light_text.dart';

class AppBarFloating extends StatelessWidget {
  const AppBarFloating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: true,
      actions: [
        const SizedBox(width: 10),
        const Center(
          child: LightText(
            text: 'Reels',
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            size: 20,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          icon: const Icon(
            CupertinoIcons.photo_camera,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
