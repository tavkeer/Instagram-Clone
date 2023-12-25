import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta/features/home/controller/home_controller.dart';

class SavePost extends StatelessWidget {
  const SavePost({Key? key, this.postId}) : super(key: key);
  final String? postId;

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return SizedBox(
      height: 30,
      width: 30,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          final data = snapshot.data!.data() as Map<String, dynamic>;
          final List<dynamic> savedPostsList = data['saved_posts'];
          final bool isBookmarked = savedPostsList.contains(postId);
          return InkWell(
            onTap: () {
              (isBookmarked)
                  ? Get.find<HomeController>().deleteSavePosts(postId!)
                  : Get.find<HomeController>().savePosts(postId!);
            },
            child: (isBookmarked)
                ? const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                    size: 30,
                  ),
          );
        },
      ),
    );
  }
}
