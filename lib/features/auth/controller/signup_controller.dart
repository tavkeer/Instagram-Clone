import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta/features/auth/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/features/onboardinguser/terms_policies.dart';

class SignUpController extends GetxController {
  //obsecure password
  RxBool hidePassword = RxBool(true);

  //signup loading
  RxBool signUpLoading = RxBool(false);

  //username
  RxBool userNameLoading = RxBool(false);
  RxBool userNameExists = RxBool(true);

  //toggle password hide
  void togglePassword() => hidePassword.value = !hidePassword.value;

  //toggle username loading
  void toggleUserNameLoading() {
    userNameLoading.value = !userNameLoading.value;
  }

  //toggle username loading indicator
  void toggleSignUpLoading() {
    signUpLoading.value = !signUpLoading.value;
  }

  Future<void> checkIfDocumentExists(String userName) async {
    try {
      toggleUserNameLoading();
      bool doesExist = await FirebaseServices.userNameExists(userName);
      userNameExists.value = doesExist;
    } catch (e) {
      debugPrint("Error checking document: $e");
      userNameExists.value = false;
    }
    toggleUserNameLoading();
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String userName,
    required String dob,
  }) async {
    try {
      toggleSignUpLoading();
      await FirebaseServices().registerUser(
        email: email,
        password: password,
        userName: userName,
        dob: dob,
      );
      FirebaseAuth.instance.authStateChanges().listen(
        (User? user) {
          if (user == null) {
            debugPrint("User is not logged in");
          } else {
            FirebaseServices()
                .saveUserInitialData(
                  email: email,
                  userName: userName,
                  dob: dob,
                )
                .whenComplete(
                  () => Get.off(() => const TermsAndPolicies()),
                );
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    toggleSignUpLoading();
  }
}
