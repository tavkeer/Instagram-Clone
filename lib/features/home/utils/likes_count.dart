import 'package:flutter/material.dart';
import 'package:insta/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta/features/auth/components/light_text.dart';

class LikesCount extends StatelessWidget {
  const LikesCount({super.key, required this.postId});
  final String postId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final data = snapshot.data!.data() as Map<String, dynamic>;
        final likedCount = data['likes_count'];
        return LightText(
          text: "$likedCount likes",
          textAlign: TextAlign.start,
          fontWeight: FontWeight.bold,
        );
      },
    );
  }
}
