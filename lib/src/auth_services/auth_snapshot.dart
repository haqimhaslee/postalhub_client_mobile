import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/auth_services/page/account_verification.dart';
import 'package:postalhub_tracker/src/auth_services/page/login.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';

class AuthSnapshot extends StatelessWidget {
  const AuthSnapshot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            if (user == null) {
              return const LoginPage();
            } else if (!user.emailVerified) {
              return const VerifyEmailPage();
            } else {
              return const NavigatorServices();
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
