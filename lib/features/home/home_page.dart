import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:insta/widgets/loading.dart';
import 'package:insta/features/home/components/stories.dart';
import 'package:insta/features/home/components/post_card.dart';
import 'package:insta/features/home/components/floating_appbar.dart';
import 'package:insta/features/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //initialize the controller
    final HomeController controller = Get.put(HomeController());

    // ScrollController to detect when the user reaches the end of the list
    final ScrollController scrollController = ScrollController();

    // Adding a listener to the scrollController
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (controller.moreDataAvailable) {
          controller.fetchPosts();
        }
      }
    });

    //body
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {},
              backgroundColor: Colors.black,
              color: Colors.white,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const AppBarFloating(),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        //stories section
                        const Stories(),
                        const SizedBox(height: 10),
                        Divider(
                          thickness: 0.3,
                          color: Colors.grey.shade600,
                        ),

                        //post section
                        FutureBuilder(
                          future: controller.fetchPosts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // If the data is still loading, show a loading indicator
                              return const Loading();
                            } else if (snapshot.hasError) {
                              // If an error occurred while fetching the data, show an error message
                              return Text(
                                  'Error loading posts: ${snapshot.error}');
                            } else {
                              // If the data has been successfully loaded, display the ListView
                              return Obx(
                                () => ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.posts.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return PostCard(
                                      post: Get.find<HomeController>()
                                          .posts[index],
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
