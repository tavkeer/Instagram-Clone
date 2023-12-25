import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/models/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(false);

  // RxList to hold the list of posts
  RxList<Post> posts = <Post>[].obs;

  RxInt currentPageIndex = 0.obs;

  // Variable to track the last document fetched
  DocumentSnapshot? lastDocument;

  // Variable to track if more data is available
  bool moreDataAvailable = true;

  final User user = FirebaseAuth.instance.currentUser!;

  Future<void> fetchPosts() async {
    try {
      Query query = FirebaseFirestore.instance.collection('posts');

      // If there is a last document, start the query after that document
      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument!);
      }

      query = query.limit(2);

      QuerySnapshot<Object?> snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        moreDataAvailable = false;
      }

      lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
      if (lastDocument == null) {
        return;
      }

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

  Future<void> toggleLike(bool currentLikedValue, String postId) async {
    final bool valueToBeUploaded = !currentLikedValue;
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({'liked': valueToBeUploaded}).whenComplete(
        () => incrementLikesCount(postId),
      );
    } on FirebaseException catch (error) {
      debugPrint('Error toggling like: ${error.message.toString()}');
    }
  }

  Future<void> incrementLikesCount(String postId) async {
    try {
      final likesCollection = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes');
      final querySnapshot =
          await likesCollection.where('liked', isEqualTo: true).get();
      final String size = querySnapshot.size.toString();

      //updating likes count
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update({'likes_count': size});

      debugPrint('likes: $size');
    } catch (error) {
      debugPrint('Error getting likes count: $error');
    }
  }

  Future<void> savePosts(String postId) async {
    try {
      //updating
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'saved_posts': FieldValue.arrayUnion([postId])
      });
    } catch (error) {
      debugPrint('Error getting likes count: $error');
    }
  }

  Future<void> deleteSavePosts(String postId) async {
    try {
      //updating
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'saved_posts': FieldValue.arrayRemove([postId])
      });
    } catch (error) {
      debugPrint('Error getting likes count: $error');
    }
  }
}
