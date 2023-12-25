import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/features/add/components/asset_thumbnail.dart';
import 'package:insta/features/add/controllers/addpost_controller.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: Get.find<AddPostController>().assets.length,
          itemBuilder: (context, index) {
            return AssetThumbnail(
              asset: Get.find<AddPostController>().assets[index],
            );
          },
        ),
      ),
    );
  }
}
