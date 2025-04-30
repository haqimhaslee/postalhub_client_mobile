// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/auth_services/page/login.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';
import 'package:postalhub_tracker/src/auth_services/page/profile_setup.dart';

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
                } else {
                  return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('client_user')
                          .doc(user.uid)
                          .get(),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child:
                                  CircularProgressIndicator(year2023: false));
                        }
                        if (userSnapshot.hasError) {
                          return const Center(
                              child: Text('Something went wrong'));
                        }

                        if (userSnapshot.hasData) {
                          final userData = userSnapshot.data!.data()
                              as Map<String, dynamic>?;
                          if (userData != null &&
                              userData['profileSetup'] == false) {
                            return const ProfileSetup();
                          } else {
                            return const NavigatorServices();
                          }
                        }
                        return const Center(child: Text('User data not found'));
                      });
                }
              }
              return const Center(
                  child: CircularProgressIndicator(year2023: false));
            }));
  }
}
