import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    this.size,
    this.img,
    this.margin,
  });
  final double? size;
  final String? img;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 70,
      width: size ?? 70,
      margin: EdgeInsets.only(right: margin ?? 20),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.yellow,
            Colors.pink,
          ],
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(3),
        child: CircleAvatar(
            radius: (size ?? 70) / 2,
            backgroundColor: Colors.grey.shade800,
            backgroundImage: (img == null)
                ? null
                : NetworkImage(
                    img!,
                    scale: 1,
                  ),
            child: (img == null)
                ? const Icon(
                    CupertinoIcons.person,
                    color: Colors.white,
                    size: 60,
                  )
                : null),
      ),
    );
  }
}
