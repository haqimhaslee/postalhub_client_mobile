import 'package:flutter/material.dart';

class NotificationMain extends StatefulWidget {
  const NotificationMain({super.key});
  @override
  State<NotificationMain> createState() => _NotificationMainState();
}

bool switchValue = false;
bool switchValue1 = false;
bool switchValue2 = false;
bool switchValue3 = false;
bool switchValue4 = false;

class _NotificationMainState extends State<NotificationMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 15),
                    child: Text(
                      "Push Notifications",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Promotions, new features, tips & more'),
                    trailing: Switch(
                      value: switchValue1,
                      onChanged: (bool newValue1) {
                        setState(() {
                          switchValue1 = newValue1;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        switchValue1 =
                            !switchValue1; // Toggle the value manually
                      });
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 15),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Top-up receipt'),
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
                  ListTile(
                    title: const Text('Payment receipt'),
                    trailing: Switch(
                      value: switchValue2,
                      onChanged: (bool newValue2) {
                        setState(() {
                          switchValue2 = newValue2;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        switchValue2 =
                            !switchValue2; // Toggle the value manually
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Monthly statement'),
                    trailing: Switch(
                      value: switchValue3,
                      onChanged: (bool newValue3) {
                        setState(() {
                          switchValue3 = newValue3;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        switchValue3 =
                            !switchValue3; // Toggle the value manually
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Promotions, new features, tips & more'),
                    trailing: Switch(
                      value: switchValue4,
                      onChanged: (bool newValue4) {
                        setState(() {
                          switchValue4 = newValue4;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        switchValue4 =
                            !switchValue4; // Toggle the value manually
                      });
                    },
                  ),
                ],
              ),
            )));
  }
}
