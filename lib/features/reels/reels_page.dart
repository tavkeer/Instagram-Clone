import 'package:flutter/material.dart';
import 'package:insta/features/reels/components/floating_appbar.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          backgroundColor: Colors.black,
          color: Colors.white,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: CustomScrollView(
            slivers: [
              const AppBarFloating(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
