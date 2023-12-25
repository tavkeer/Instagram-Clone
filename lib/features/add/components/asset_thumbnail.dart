import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:insta/features/add/controllers/addpost_controller.dart';

class AssetThumbnail extends StatelessWidget {
  final AssetEntity? asset;

  const AssetThumbnail({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (asset == null) {
      return const Center(child: Icon(Icons.image));
    }

    return GestureDetector(
      onTap: () {
        Get.find<AddPostController>().selectedAsset.value = asset;
      },
      child: FutureBuilder<Uint8List?>(
        future: asset!.thumbnailData,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Center(child: Icon(Icons.error));
          } else if (snapshot.hasData) {
            final bytes = snapshot.data;
            if (bytes == null) {
              return const Center(child: Icon(Icons.error));
            }
            return Image.memory(bytes, fit: BoxFit.cover);
          } else {
            return const Center(child: Icon(Icons.image));
          }
        },
      ),
    );
  }
}
