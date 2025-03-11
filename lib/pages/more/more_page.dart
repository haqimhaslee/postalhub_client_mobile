// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:postalhub_tracker/pages/more/information/about.dart';
import 'package:postalhub_tracker/pages/more/information/updates_info_at.dart';
import 'package:postalhub_tracker/pages/profile/profile_widget.dart';
import 'package:postalhub_tracker/src/auth_services/login.dart';
import 'package:postalhub_tracker/src/auth_services/register.dart';
//import 'package:postalhub_tracker/pages/home/home_widgets/carousel_viewer.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  @override
  State<MorePage> createState() => _MorePageState();
}

Future<void> _privacypolicy(BuildContext context) async {
  final theme = Theme.of(context);
  try {
    await launchUrl(
      Uri.parse(
          'https://www.termsfeed.com/live/9187d68f-f1e8-4d89-921f-f8432437ba97'),
      customTabsOptions: CustomTabsOptions(
        colorSchemes: CustomTabsColorSchemes.defaults(
          toolbarColor: theme.colorScheme.surface,
          navigationBarColor: theme.colorScheme.surface,
        ),
        shareState: CustomTabsShareState.off,
        urlBarHidingEnabled: true,
        showTitle: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        preferredBarTintColor: theme.colorScheme.surface,
        preferredControlTintColor: theme.colorScheme.onSurface,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
      ),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

bool switchValue = false;

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        //appBar: AppBar(
        //  title: const Text('More'),
        //),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              child: ListView(
                children: [
                  const Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 8),
                          child: ClipRRect(
                            child: SizedBox(
                              width: 600,
                              child: ProfileOverviewWidget(),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 15),
                    child: Text(
                      "My Account (Coming Soon)",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Personal Information'),
                    subtitle: const Text('View and edit personal information'),
                    leading: const Icon(Icons.person_outline_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Change Password'),
                    subtitle: const Text('Change account password'),
                    leading: const Icon(Icons.password_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Adressess'),
                    subtitle: const Text('Manage saved adressess'),
                    leading: const Icon(Icons.home_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Bank Account / Card'),
                    subtitle: const Text('Manage payment methods'),
                    leading: const Icon(Icons.credit_card_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Biometric Lock'),
                    subtitle: const Text('Biometric lock for better security'),
                    leading: const Icon(Icons.fingerprint_outlined),
                    onTap: () {},
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "App Settings (Coming Soon)",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Theme'),
                    subtitle: const Text('Change app theme'),
                    leading: const Icon(Icons.color_lens_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Language'),
                    leading: const Icon(Icons.language_rounded),
                    subtitle: const Text('Change app language'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Notification'),
                    subtitle: const Text('Manage notification settings'),
                    leading: const Icon(Icons.notifications_rounded),
                    trailing: Switch(
                      value: switchValue,
                      onChanged: (bool newValue) {
                        setState(() {
                          switchValue = newValue;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        switchValue = !switchValue; // Toggle the value manually
                      });
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Information",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Terms and Privacy Policy'),
                    subtitle: const Text('View Terms and Privacy Policy'),
                    leading: const Icon(Icons.developer_board_rounded),
                    onTap: () => _privacypolicy(context),
                  ),
                  ListTile(
                    title: const Text('Licences'),
                    subtitle: const Text('View open source licences'),
                    leading: const Icon(Icons.description_outlined),
                    onTap: () => showLicensePage(
                      context: context,
                    ),
                  ),
                  ListTile(
                    title: const Text('Release Updates'),
                    subtitle: const Text('View release updates'),
                    leading: const Icon(Icons.update_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdatesInfoAt()));
                    },
                  ),
                  ListTile(
                    title: const Text('App info'),
                    subtitle: const Text('Version : 25.3.809-mobile'),
                    leading: const Icon(Icons.info_outline_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const About()));
                    },
                  ),
                  ListTile(
                    title: const Text('Login Test'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  ),
                  ListTile(
                    title: const Text('Register Test'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                  ),
                  ListTile(
                    title: const Text('Log Out',
                        style: TextStyle(color: Colors.red)),
                    leading:
                        const Icon(Icons.logout_rounded, color: Colors.red),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            )));
  }
}
