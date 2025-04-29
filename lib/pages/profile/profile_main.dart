import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/auth_services/auth_services.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});
  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

Future<void> logout() async {
  try {
    await AuthService.logout();
    // ignore: empty_catches
  } catch (e) {}
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                  title: const Center(
                    child: Text('Log Out', style: TextStyle(color: Colors.red)),
                  ),
                  onTap: () async {
                    final shouldLogout = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context,
                                  true); // return true to previous route
                              Navigator.of(context).popUntil(
                                  (route) => route.isFirst); // go to root
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                    );

                    if (shouldLogout == true) {
                      logout();
                    }
                  }),
            ],
          ),
        ));
  }
}
