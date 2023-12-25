import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:insta/features/home/utils/like_widget.dart';
import 'package:insta/features/home/utils/save_post.dart';

class InteractionCard extends StatelessWidget {
  const InteractionCard({super.key, required this.id});
  final String? id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //like section
            LikeWidget(postId: id),
            const SizedBox(width: 15),

            //comment section
            const Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 15),

            //share section
            const ImageIcon(
              AssetImage(
                'assets/images/send.png',
              ),
              color: Colors.white,
              size: 25,
            ),
            const Spacer(),

            //save post section
            SavePost(postId: id),
          ],
        ),
      ),
    );
  }
}
