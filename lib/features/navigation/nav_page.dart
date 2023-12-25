// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:insta/features/home/home_page.dart';
import 'package:insta/features/reels/reels_page.dart';
import 'package:insta/features/add/add_postpage.dart';
import 'package:insta/features/search/search_page.dart';
import 'package:insta/features/profile/profile_page.dart';
import 'package:insta/features/navigation/components/bottom_nav.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // ignore: prefer_const_constructors
          HomePage(key: PageStorageKey('HomePage')),
          const SearchPage(),
          const AddPostPage(),
          const ReelsPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavBarCustom(
        pageController: pageController,
      ),
    );
  }
}
