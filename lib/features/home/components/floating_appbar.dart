import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        Image.asset(
          'assets/images/banner.png',
          color: Colors.white,
        ),
        const Spacer(),
        IconButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          icon: const Icon(
            Icons.favorite_outline,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(width: 15),
        const ImageIcon(
          AssetImage(
            'assets/images/send.png',
          ),
          size: 28,
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
