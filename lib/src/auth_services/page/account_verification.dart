import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Please verify your email to continue."),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (user != null && !user.emailVerified) {
                  await user.sendEmailVerification();
                }
              },
              child: const Text("Resend Verification Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await user?.reload();
                if (FirebaseAuth.instance.currentUser!.emailVerified) {
                  (context as Element).reassemble();
                }
              },
              child: const Text("I've Verified My Email"),
            ),
          ],
        ),
      ),
    );
  }
}
