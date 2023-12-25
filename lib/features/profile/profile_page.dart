import 'package:insta/features/profile/controller/profile_controller.dart';
import 'package:insta/features/profile/components/appbar_floating.dart';
import 'package:insta/features/profile/components/profile_actions.dart';
import 'package:insta/features/profile/components/profile_details.dart';
import 'package:insta/features/profile/components/user_posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          backgroundColor: Colors.black,
          color: Colors.white,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: const CustomScrollView(
            slivers: [
              //profile appbar
              AppBarFloatingProfile(),

              //userDetails like profile image, followers etc
              ProfileDetails(),

              //edit and share profile buttons
              ProfileActionButton(),

              //post section
              UserPosts(),
            ],
          ),
        ),
      ),
    );
  }
}
