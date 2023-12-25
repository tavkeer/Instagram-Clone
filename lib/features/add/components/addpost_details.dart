import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:insta/features/add/utils/post_details.dart';
import 'package:insta/features/add/utils/share_button.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/add/components/zoomable_image.dart';

class AddPostDetails extends StatelessWidget {
  const AddPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //caption
    final TextEditingController caption = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const DarkText(text: 'New Post'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  //zoom
                  const ZoomableImage(imgRatio: 3),

                  TextField(
                    controller: caption,
                    style: TextStyle(color: Colors.grey.shade100),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write a caption...',
                      hintStyle: TextStyle(color: Colors.grey.shade100),
                      contentPadding: const EdgeInsets.only(left: 10),
                    ),
                  ),

                  //PostDetails(),
                  const PostDetails(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShareButton(caption: caption),
          )
        ],
      ),
    );
  }
}
