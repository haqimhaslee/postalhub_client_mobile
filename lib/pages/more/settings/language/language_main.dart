import 'package:flutter/material.dart';

class LanguageMain extends StatefulWidget {
  const LanguageMain({super.key});
  @override
  State<LanguageMain> createState() => _LanguageMainState();
}

bool switchValue = false;
bool switchValue1 = false;
bool switchValue2 = false;
bool switchValue3 = false;
bool switchValue4 = false;

class _LanguageMainState extends State<LanguageMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Languages'),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('English'),
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
