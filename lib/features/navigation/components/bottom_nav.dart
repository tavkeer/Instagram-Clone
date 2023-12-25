import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatelessWidget {
  const BottomNavBarCustom({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      onTap: (index) {
        if (index == 0) {
          // Get.find<HomeController>().fetchPosts();
          // (  Get.find<HomeController>().lastDocument == null)
        }
        pageController.jumpToPage(index);
      },
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.home_filled,
            size: 35,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.search,
            size: 35,
          ),
          label: "Serach",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.add_circle_outline_outlined,
            size: 35,
          ),
          label: "Add",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: ImageIcon(
            AssetImage(
              'assets/images/reel.png',
            ),
            size: 35,
          ),
          label: "Reels",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.person_outline,
            size: 35,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
