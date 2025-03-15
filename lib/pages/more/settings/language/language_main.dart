import 'package:flutter/material.dart';

class LanguageMain extends StatefulWidget {
  const LanguageMain({super.key});
  @override
  State<LanguageMain> createState() => _LanguageMainState();
}

class _LanguageMainState extends State<LanguageMain> {
  String selectedOption = 'English'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Languages'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 750),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                child: Text(
                  "Languages",
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              RadioListTile<String>(
                title: const Text('English'),
                value: 'English',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Bahasa Melayu'),
                value: 'Bahasa Melayu',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Payment receipt'),
                value: 'Payment receipt',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Monthly statement'),
                value: 'Monthly statement',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Promotions, new features, tips & more'),
                value: 'Promotions',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
