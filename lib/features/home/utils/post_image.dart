import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostImage extends StatelessWidget {
  final String imgLink;
  const PostImage({super.key, required this.imgLink});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgLink,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: Icon(
          Icons.image,
        ),
      ),
      errorWidget: (context, url, error) {
        // Handle the error, e.g., show a placeholder or an error message
        return Container(
          width: Get.width,
          color: Colors.grey.shade700,
          child: const Icon(
            Icons.image,
            color: Colors.white,
            size: 40,
          ),
        );
      },
    );
  }
}
