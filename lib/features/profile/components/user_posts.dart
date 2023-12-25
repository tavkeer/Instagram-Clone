import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/widgets/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:insta/features/profile/controller/profile_controller.dart';

class UserPosts extends StatelessWidget {
  const UserPosts({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return SliverToBoxAdapter(
      child: SizedBox(
        width: Get.width,
        child: FutureBuilder(
          future: controller.fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            } else if (snapshot.hasError) {
              return Text('Error loading posts: ${snapshot.error}');
            } else {
              // If the data has been successfully loaded, display the ListView
              return Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: controller.posts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final img =
                        Get.find<ProfileController>().posts[index].imgLink!;
                    return CachedNetworkImage(
                      imageUrl: img,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
