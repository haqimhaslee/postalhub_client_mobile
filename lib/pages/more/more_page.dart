// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/more/about/about_main.dart';
//import 'package:postalhub_tracker/pages/more/payments/payment_history/payment_history_main.dart';
//import 'package:postalhub_tracker/pages/more/payments/payment_methods/payment_methods_main.dart';
import 'package:postalhub_tracker/pages/more/settings/appearance/appearance_main.dart';
import 'package:postalhub_tracker/pages/more/settings/language/language_main.dart';
//import 'package:postalhub_tracker/pages/more/settings/notification/notification_settings.dart';
//import 'package:postalhub_tracker/pages/more/settings/security/security_main.dart';
import 'package:postalhub_tracker/pages/profile/points_history.dart';
import 'package:postalhub_tracker/pages/profile/profile_info/main_profile.dart';
import 'package:postalhub_tracker/pages/services/customer_services/customer_services.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  @override
  State<MorePage> createState() => _MorePageState();
}

bool switchValue = false;

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              child: ListView(
                children: [
                  if (!kIsWeb)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 0, top: 15),
                            child: Text(
                              "Account",
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text('Personal Information'),
                            leading: const Icon(Icons.person_outline_rounded),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileMain()));
                            },
                          ),
                        ]),
                  /*
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Payments",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Payment methods'),
                    leading: const Icon(Icons.credit_card_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentMethodsMain()));
                    },
                  ),
                  ListTile(
                    title: const Text('Payment history'),
                    leading: const Icon(Icons.history_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentHistoryMain()));
                    },
                  ),
                  */
                  if (!kIsWeb)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 0, top: 20),
                            child: Text(
                              "Postal Hub",
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text('Postal point'),
                            leading: const Icon(Icons.local_activity_outlined),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Points history'),
                            leading: const Icon(Icons.history_outlined),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PointsHistory()));
                            },
                          ),
                        ]),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  /*
                  ListTile(
                    title: const Text('Security'),
                    leading: const Icon(Icons.lock_outline_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecurityMain()));
                    },
                  ),

                  */
                  ListTile(
                    title: const Text('Appearance'),
                    leading: const Icon(Icons.palette_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppearanceMain()));
                    },
                  ),
                  ListTile(
                    title: const Text('Languages'),
                    leading: const Icon(Icons.translate_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LanguageMain()));
                    },
                  ),

                  /*
                  ListTile(
                    title: const Text('Notifications'),
                    leading: const Icon(Icons.notifications_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationMain()));
                    },
                  ),

                  */
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Support",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Help & Support Center'),
                    leading: const Icon(Icons.help_outline_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerServices()));
                    },
                  ),
                  ListTile(
                    title: const Text('About'),
                    leading: const Icon(Icons.info_outline_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutMain()));
                    },
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )));
  }
}
