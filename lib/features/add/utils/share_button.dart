import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/add/controllers/addpost_controller.dart';
import 'package:insta/widgets/loading.dart';

class ShareButton extends StatelessWidget {
  final TextEditingController caption;
  const ShareButton({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.width,
      padding: const EdgeInsets.only(top: 10, bottom: 35, right: 10, left: 10),
      decoration: const BoxDecoration(color: Colors.black),
      child: Obx(
        () => ElevatedButton(
          onPressed: () => Get.find<AddPostController>().uploadAndSave(
            caption.text.trim(),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Color.fromRGBO(0, 149, 246, 1.0);
                }
                return const Color.fromRGBO(0, 149, 246, 1.0);
              },
            ),
          ),
          child: (Get.find<AddPostController>().isLoading.value)
              ? const Loading()
              : const LightText(
                  text: 'Share',
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 18,
                ),
        ),
      ),
    );
  }
}
