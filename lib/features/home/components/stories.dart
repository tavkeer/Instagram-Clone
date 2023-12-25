import 'package:insta/features/home/utils/addstory_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),

            //add your story section
            AddStory(),
            SizedBox(width: 20),
            //rest Stories
            // ListView.builder(
            //   itemCount: 8,
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) => const StoryCard(),
            // ),
          ],
        ),
      ),
    );
  }
}
