import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AuthTemplate extends StatelessWidget {
  final Widget child;
  final PageController? pageController;
  final bool? backButton;
  const AuthTemplate({
    super.key,
    required this.child,
    this.pageController,
    this.backButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: (backButton ?? true)
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: previousPage,
              )
            : null,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background/auth_back.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }

  void previousPage() {
    if (pageController!.page == 0) {
      Get.back();
    } else {
      pageController!.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
