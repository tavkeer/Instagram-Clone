import 'package:insta/features/add/components/addpost_appbar.dart';
import 'package:insta/features/add/components/zoomable_image.dart';
import 'package:insta/features/add/controllers/addpost_controller.dart';
import 'package:insta/features/add/components/actions_performed.dart';
import 'package:insta/features/add/components/image_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPostController());
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AddPostAppBar(),
      ),
      body: Column(
        children: [
          //zoom
          ZoomableImage(),

          //actions section
          ActionsPerformed(),

          //image selectin section
          ImageSection(),
        ],
      ),
    );
  }
}
