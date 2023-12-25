import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStory extends StatelessWidget {
  const AddStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey.shade400,
            child: const Icon(
              CupertinoIcons.person,
              color: Colors.white,
              size: 60,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue[600],
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
