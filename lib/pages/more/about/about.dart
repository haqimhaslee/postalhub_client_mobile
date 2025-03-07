import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar.large(
        title: Text('FAQs / About Us'),
      ),
      SliverToBoxAdapter(
          child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 650,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const ExpansionTile(
                                    initiallyExpanded: true,
                                    title: Text(
                                      'About new parcel tracking system',
                                      style: TextStyle(fontSize: 19.0),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          'This parcel tracking system is designed to provide real-time updates and tracking information for your shipments.',
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: const Text(
                                      'Our System Developers',
                                      style: TextStyle(fontSize: 19.0),
                                    ),
                                    children: <Widget>[
                                      Card(
                                        elevation: 5,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            width: 400,
                                            'assets/images/dev_pic1.png',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const ExpansionTile(
                                    title: Text(
                                      'Technology we used',
                                      style: TextStyle(fontSize: 19.0),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          'The system utilizes Google Cloud Platform, Gemini API and few more cloud solutions for efficient data management and integration.',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const ExpansionTile(
                                    title: Text(
                                      'Bringing the latest/exciting technology',
                                      style: TextStyle(fontSize: 19.0),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          'Our team is dedicated to bringing you cutting-edge technology to enhance your shipping and tracking experience.',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const ExpansionTile(
                                    title: Text(
                                      'The beginning of a multi-year project',
                                      style: TextStyle(fontSize: 19.0),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          'We are committed to expanding and improving this system over the coming years to provide even more features and reliability.',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        const Text(
                          'More exciting features coming soon... ✌️',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 15.0),
                        FilledButton(
                            onPressed: () => _launchUrl(
                                'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
                            child: const Text("Easter Egg 🥚")),
                        const SizedBox(height: 15.0),
                      ]))))
    ]));
  }
}
