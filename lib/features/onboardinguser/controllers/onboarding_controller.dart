import 'package:insta/features/onboardinguser/welcome_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

class OnBoardingController extends GetxController {
  //boolean
  RxBool fileLoaded = RxBool(false);
  RxBool onboardingLoading = RxBool(false);
  RxString userName = RxString('');

  //toggle function
  void toggleFileLoaded() => fileLoaded.value = !fileLoaded.value;
  void toggleonboardingLoading() {
    onboardingLoading.value = !onboardingLoading.value;
  }
  // functions

  Future<void> getUserName() async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid;
      final DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = snapshot.data() as Map<String, dynamic>;

      final String name = data['user_name'];

      //setting value
      userName.value = name;
      debugPrint("userName: ${userName.value}");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveToFirebase(String imgLink) async {
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profile_link': imgLink,
        'uid': userId,
      }).whenComplete(() {
        getUserName().whenComplete(() => Get.off(() => const WelcomePage()));
      });
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }

  Future uploadFile(PlatformFile pickedfile) async {
    UploadTask? uploadTask;
    if (fileLoaded.value) {
      try {
        final file = File(pickedfile.path!);
        onboardingLoading.value = true;
        final path = 'profile/${pickedfile.name}';
        final ref = FirebaseStorage.instance.ref().child(path);
        uploadTask = ref.putFile(file);

        final snapshot = await uploadTask;
        final urlDownload = await snapshot.ref.getDownloadURL();
        debugPrint("profileLink: $urlDownload");
        await saveToFirebase(urlDownload);
      } on FirebaseException catch (e) {
        debugPrint(e.message);
      }
    }
    onboardingLoading.value = false;
  }
}
