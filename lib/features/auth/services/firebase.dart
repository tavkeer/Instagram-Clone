// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/features/home/home_page.dart';

class FirebaseServices {
  //firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //user instance
  final User? user = FirebaseAuth.instance.currentUser;

  static Future<bool> userNameExists(String userName) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      CollectionReference collectionReference = firestore.collection('users');

      QuerySnapshot querySnapshot = await collectionReference
          .where('userName', isEqualTo: userName)
          .get();

      debugPrint('UserExists: ${querySnapshot.docs.isNotEmpty}');
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      debugPrint("Error checking document: $e");
      return false;
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String userName,
    required String dob,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveUserInitialData({
    required String email,
    required String userName,
    required String dob,
  }) async {
    try {
      //setting initail account data
      _firestore.collection('users').doc(user!.uid).set({
        'email': email,
        'user_name': userName,
        "dob": dob,
        'created_at': DateTime.now().toString(),
        'posts_count': '0',
        'followers_count': '0',
        'following_count': '0',
        'followers_ids': [],
        'following_ids': [],
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseAuth.instance.authStateChanges().listen(
        (User? user) {
          if (user == null) {
            debugPrint("User is not logged in");
          } else {
            Get.offAll(() => const HomePage());
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }
}
