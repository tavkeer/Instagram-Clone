import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/models/post.dart';

class ProfileController extends GetxController {
  RxString username = RxString('');
  RxString postsCount = RxString('0');
  RxString followersCount = RxString('0');
  RxString followingCount = RxString('0');
  RxString profileLink = RxString(
      'https://dunlite.com.au/wp-content/uploads/2019/04/placeholder.jpg');

  // RxList to hold the list of posts
  RxList<Post> posts = <Post>[].obs;

  Future<void> fetchPosts() async {
    try {
      Query query = FirebaseFirestore.instance.collection('posts');
      QuerySnapshot<Object?> snapshot = await query
          .where('poster_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      // Add posts from the snapshot to the list
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Post post = Post(
          id: doc.id,
          caption: data['caption'],
          commentsCount: data['comments_count'],
          imgLink: data['img_link'],
          latestComment: data['latest_comment'],
          likesCount: data['likes_count'],
          postedAt: data['posted_at'],
          posterUserName: data['poster_userName'],
          posterId: data['poster_id'],
        );
        if (!posts.any((existingPost) => existingPost.id == post.id)) {
          posts.add(post);
        }
      }
    } catch (error) {
      debugPrint('Error fetching posts: $error');
    }
  }

  Future<void> getUserInfo() async {
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      final data = snapshot.data() as Map<String, dynamic>;

      //assigning the valuesß
      username.value = data['user_name'];
      postsCount.value = data['posts_count'];
      followersCount.value = data['followers_count'];
      followingCount.value = data['following_count'];
      profileLink.value = data['profile_link'];

      //
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onReady() async {
    getUserInfo();
    super.onReady();
  }
}
