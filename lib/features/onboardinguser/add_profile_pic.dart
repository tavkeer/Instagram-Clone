// ignore_for_file: unused_local_variable, unused_element

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:insta/features/onboardinguser/controllers/onboarding_controller.dart';
import 'package:insta/features/onboardinguser/welcome_page.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/widgets/auth_template.dart';
import 'package:insta/widgets/hollow_button.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProfilePicture extends StatelessWidget {
  const AddProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    //file selected
    PlatformFile? pickedfile;
    File? pickedFilePath;

    //controllers initialized
    Get.put(SignUpController());
    Get.put(OnBoardingController());

    // functions
    Future saveToFirebase(String imgLink) async {
      try {
        final String userId = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'profileLink': imgLink,
          'uid': userId,
          'posted_at': DateTime.now().toString(),
        });
      } on FirebaseException catch (e) {
        debugPrint(e.message);
      }
    }

    Future selectFile() async {
      try {
        final result = await FilePicker.platform.pickFiles();
        if (result != null && result.files.isNotEmpty) {
          pickedfile = result.files.first;
          Get.find<OnBoardingController>().toggleFileLoaded();
          final file = File(pickedfile!.path!);
          final path = pickedfile!.name;
          debugPrint(path);
        } else {
          debugPrint('File picking canceled by the user');
        }
      } catch (e) {
        debugPrint('Error during file picking: ${e.toString()}');
      }
    }

    return AuthTemplate(
      backButton: false,
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            const DarkText(
              text: "Add a profile picture",
            ),
            const SizedBox(height: 10),
            const LightText(
              text:
                  "Add a profile picture so that your friends know it's you. Everyone will be able to see your picture.",
            ),
            //button
            const SizedBox(height: 50),

            Obx(
              () => Center(
                child: GestureDetector(
                  onTap: selectFile,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: (Get.find<OnBoardingController>().fileLoaded.value)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              File(pickedfile!.path!),
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(
                            CupertinoIcons.person,
                            color: Colors.grey,
                            size: 150,
                          ),
                  ),
                ),
              ),
            ),
            const Spacer(),

            Button(
                text: 'Next',
                controller: Get.find<OnBoardingController>().onboardingLoading,
                ontap: () {
                  (Get.find<OnBoardingController>().fileLoaded.value)
                      ? Get.find<OnBoardingController>().uploadFile(pickedfile!)
                      : null;
                }),
            const SizedBox(height: 10),
            HollowButton(
              text: "Skip",
              borderColor: Colors.grey.shade300,
              textColor: Colors.white,
              onTap: () => Get.off(() => const WelcomePage()),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
