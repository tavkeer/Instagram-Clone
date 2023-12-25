import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta/features/navigation/nav_page.dart';

class AddPostController extends GetxController {
  RxBool isLoading = RxBool(false);

  //reactive list for the thumbnails
  RxList<AssetEntity> assets = RxList<AssetEntity>([]);

  Rx<AssetEntity?> selectedAsset = Rx<AssetEntity?>(null);

  //fetching method
  Future fetchAssets() async {
    try {
      final albums = await PhotoManager.getAssetPathList(onlyAll: true);
      final recentAlbum = albums.first;

      final recentAssets = await recentAlbum.getAssetListRange(
        start: 0,
        end: 1000000,
      );

      assets.value = recentAssets;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void selectAsset(AssetEntity asset) {
    selectedAsset.value = asset;
  }

  Future<void> uploadAndSave(String caption) async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    isLoading.value = true;
    AssetEntity selectedEntity =
        selectedAsset.value ?? (assets.isNotEmpty ? assets[0] : null)!;

    try {
      String fileName =
          '${user!.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference storageReference = storage.ref().child('posts/$fileName');
      File? file = await selectedEntity.file;
      await storageReference.putFile(file!);
      String downloadURL = await storageReference.getDownloadURL();

      DocumentReference postRef = await firestore.collection('posts').add(
        {
          "caption": caption,
          "comments_count": '0',
          "img_link": downloadURL,
          "latest_comment": '',
          "likes_count": '0',
          "posted_at": DateTime.now().toString(),
          "poster_id": user.uid,
          "saved_posts": [],
        },
      );

      String documentId = postRef.id;

      await postRef.update({'id': documentId}).then((_) {
        debugPrint('Document ID updated successfully');
      }).catchError((error) {
        debugPrint('Error updating document ID: $error');
      });
      //updating the name of the user
      String name = '';
      final snapshot = await firestore.collection('users').doc(user.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      name = data['user_name'];
      await firestore
          .collection('posts')
          .doc(documentId)
          .update({'poster_userName': name}).whenComplete(
        () => incrementPostsCount(postRef.id),
      );

      //setting the value again to null or initial value
      selectedAsset.value = null;

      //navigating to Home screen after the post is updated
      Get.offAll(() => const NavigationPage());

      //errors
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
    }
    isLoading.value = false;
  }

  Future<void> incrementPostsCount(String postId) async {
    User user = FirebaseAuth.instance.currentUser!;
    try {
      final postsCollection = FirebaseFirestore.instance.collection('posts');
      final querySnapshot =
          await postsCollection.where('poster_id', isEqualTo: user.uid).get();
      final String size = querySnapshot.size.toString();

      //updating posts count
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'posts_count': size});

      debugPrint('likes: $size');
    } on FirebaseException catch (error) {
      debugPrint('Error getting Posts count: ${error.message.toString()}');
    }
  }

  @override
  void onReady() {
    fetchAssets();
    super.onReady();
  }
}
