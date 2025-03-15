import 'package:flutter/material.dart';

class AppearanceMain extends StatefulWidget {
  const AppearanceMain({super.key});
  @override
  State<AppearanceMain> createState() => _AppearanceMainState();
}

class _AppearanceMainState extends State<AppearanceMain> {
  String selectedOption = 'Auto'; // Default selection

  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Appearance'),
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
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Theme",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  RadioListTile<String>(
                    title: const Text('Light'),
                    value: 'Light',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Dark'),
                    value: 'Dark',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Use device settings'),
                    subtitle: const Text(
                        'Apply the same theme set on your device to the app.'),
                    value: 'Auto',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ],
              ),
            )));
  }
}
