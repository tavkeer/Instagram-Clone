import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/light_text.dart';

class ActionsPerformed extends StatelessWidget {
  const ActionsPerformed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DarkText(text: 'Recents', size: 18),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.square_stack_3d_up,
                  color: Colors.white,
                ),
                SizedBox(width: 3),
                LightText(text: 'SELECT MULTIPLE')
              ],
            ),
          ),
          const SizedBox(width: 7),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
