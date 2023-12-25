import 'package:insta/features/home/components/interaction_card.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/home/utils/likes_count.dart';
import 'package:insta/features/home/utils/post_image.dart';
import 'package:insta/features/home/utils/user_info.dart';
import 'package:get/route_manager.dart';
import 'package:insta/models/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //uploader information
          UserInfo(name: post.posterUserName ?? ''),
          const SizedBox(height: 5),

          // image Section
          Expanded(child: PostImage(imgLink: post.imgLink ?? '')),

          //like and comment section
          InteractionCard(id: post.id),

          //post details
          LikesCount(postId: post.id!),
          LightText(
            text: post.caption ?? '',
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          const LightText(
            text: '...more',
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            textColor: Colors.grey,
          ),
          LightText(
            text: 'View all ${post.commentsCount} comments',
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            textColor: Colors.grey,
          ),
          LightText(
            text: getPostedDated(post.postedAt!),
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            textColor: Colors.grey,
          ),

          const SizedBox(height: 10),
          Divider(
            thickness: 0.3,
            color: Colors.grey.shade600,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

String getPostedDated(String date) {
  DateTime now = DateTime.parse(date);
  String formattedDate = DateFormat('dd MMMM').format(now);
  return formattedDate;
}
