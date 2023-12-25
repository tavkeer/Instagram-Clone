import 'package:insta/features/auth/services/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool loginLoading = RxBool(false);

  void changeLoading() => loginLoading.value = !loginLoading.value;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      changeLoading();
      await FirebaseServices().loginUser(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    changeLoading();
  }
}
