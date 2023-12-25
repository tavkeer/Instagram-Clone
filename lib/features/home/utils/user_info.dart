import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/home/utils/story.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const StoryCard(
            size: 35,
            margin: 10,
            img:
                'https://pbs.twimg.com/media/F_-H0WXXsAE66_v?format=jpg&name=large',
          ),
          LightText(
            text: name,
            fontfamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.bold,
            size: 16,
          ),
          const Spacer(),
          const Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
