import 'package:insta/features/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta/features/navigation/nav_page.dart';
import 'package:insta/widgets/loading.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else {
            if (snapshot.hasData) {
              return const NavigationPage();
            } else {
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}
