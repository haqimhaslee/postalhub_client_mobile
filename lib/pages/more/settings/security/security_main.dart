import 'package:flutter/material.dart';

class SecurityMain extends StatefulWidget {
  const SecurityMain({super.key});
  @override
  State<SecurityMain> createState() => _SecurityMainState();
}

bool switchValue = false;

class _SecurityMainState extends State<SecurityMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Security'),
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
                      "Manage your account security preferences.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Enable biometric'),
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
                    title: const Text('Change password'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                ],
              ),
            )));
  }
}
