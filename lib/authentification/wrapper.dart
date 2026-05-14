// wrapper.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/screens/loginsignuppage.dart';
import 'package:furniture/screens/onboardingscreen.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // User logged in
        if (snapshot.hasData) {
          return const OnboardingScreen();
        }

        // User not logged in
        return const LoginSignupPage();
      },
    );
  }
}