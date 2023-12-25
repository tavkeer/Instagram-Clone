import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta/features/home/controller/home_controller.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({Key? key, this.postId}) : super(key: key);
  final String? postId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .collection('likes')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          final likedDocs = snapshot.data?.docs;
          bool isLiked = likedDocs != null && likedDocs.isNotEmpty
              ? likedDocs[0]['liked']
              : false;

          return InkWell(
            onTap: () {
              Get.find<HomeController>().toggleLike(isLiked, postId!);
            },
            child: (isLiked)
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                    size: 30,
                  ),
          );
        },
      ),
    );
  }
}
