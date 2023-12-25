import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/features/add/components/asset_thumbnail.dart';
import 'package:insta/features/add/controllers/addpost_controller.dart';

class ZoomableImage extends StatelessWidget {
  final double? imgRatio;
  const ZoomableImage({
    super.key,
    this.imgRatio,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddPostController>();
    return Obx(
      () => SizedBox(
        height: Get.height * (imgRatio ?? 4) / 9,
        width: Get.width,
        child: AssetThumbnail(
          asset: (controller.selectedAsset.value != null)
              ? controller.selectedAsset.value
              : (controller.assets.isNotEmpty)
                  ? controller.assets[0]
                  : null,
        ),
      ),
    );
  }
}
