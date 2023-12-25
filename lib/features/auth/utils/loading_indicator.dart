import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.controller});

  final dynamic controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.value ?? false)
          ? Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Colors.grey.shade300,
                  strokeWidth: 3,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
