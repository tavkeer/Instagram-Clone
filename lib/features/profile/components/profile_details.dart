import 'package:insta/features/profile/controller/profile_controller.dart';
import 'package:insta/features/profile/utils/postdetails_template.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/home/utils/story.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: Get.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //profile section
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StoryCard(
                    img: Get.find<ProfileController>().profileLink.value,
                  ),
                  const SizedBox(height: 5),
                  DarkText(
                    text: Get.find<ProfileController>().username.value,
                    size: 16,
                  )
                ],
              ),
            ),

            //posts
            PostDetailsTemplate(
              controller: Get.find<ProfileController>().postsCount,
              text: 'Posts',
            ),
            PostDetailsTemplate(
              controller: Get.find<ProfileController>().followersCount,
              text: 'Followers',
            ),
            PostDetailsTemplate(
              controller: Get.find<ProfileController>().followingCount,
              text: 'Following',
            ),
          ],
        ),
      ),
    );
  }
}
