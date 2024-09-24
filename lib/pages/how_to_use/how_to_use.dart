import 'package:flutter/material.dart';

class HowToUse extends StatefulWidget {
  const HowToUse({super.key});

  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'How to use?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  '____________________________',
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Track your parcel',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '• Enter your tracking number in the Tracking Number field*',
                  style: TextStyle(fontSize: 16.0),
                ),
                const Text(
                  '(*Case sensitive)',
                  style: TextStyle(fontSize: 10.0),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      width: 400,
                      'assets/images/How_to_use_1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "• Click 'Search' and this site will search your parcel information in our database",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      width: 400,
                      'assets/images/How_to_use_2.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  '____________________________',
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Interact with 'Ask AI'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "• With 'Ask AI', you can ask nearly any question—from general queries to questions regarding Postal Hub.¹",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  '____________________________',
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Parcel Library, Parcel Arrived Notification, Reward Points and more²',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '• More features are available in mobile app.',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                FilledButton(
                    onPressed: () {},
                    child: const Text("Download Mobile App³")),
                const SizedBox(height: 50.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "¹ Powered by Gemini 1.5 Flash.There is no chat or interaction history saved by this AI model. The AI model, which was trained on a dataset that contains general data knowledge up to mid 2024 and is continuously updated, to learn and process information using Google's core algorithms.",
                      style: TextStyle(fontSize: 10.0),
                    ),
                    Text(
                      "² Account registration required.",
                      style: TextStyle(fontSize: 10.0),
                    ),
                    Text(
                      "³ Coming soon in Google Play Store and Apple App Store.",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
