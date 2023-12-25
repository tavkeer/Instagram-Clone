import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        strokeCap: StrokeCap.butt,
        strokeWidth: 4.5,
      ),
    );
  }
}
