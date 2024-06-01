import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'About this new parcel tracking system',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'This parcel tracking system is designed to provide real-time updates and tracking information for your shipments.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 40.0),
                Text(
                  'Developers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'This system or application was created through collaboration with Haqim Haslee, who is associated with Google Developers Group (GDG) Kuala Lumpur and is also part of the Google Cloud Innovators program. His expertise and involvement from these platforms likely contributed valuable insights and technical contributions to the development process. His affiliation with GDG Kuala Lumpur suggests a connection to a community of developers focused on Google technologies, while being a Google Cloud Innovator underscores his innovative approach within the Google Cloud ecosystem. Together, this partnership highlights a commitment to leveraging cutting-edge technologies and fostering innovation in the development of the system or application.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 40.0),
                Text(
                  'Technology used to develop this system',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'The system utilizes Google Cloud services and the Gemini API for efficient data management and integration.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 40.0),
                Text(
                  'We are excited to bring the latest/exciting technology to you',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Our team is dedicated to bringing you cutting-edge technology to enhance your shipping and tracking experience.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 40.0),
                Text(
                  'This is just the beginning of a multiyear project',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'We are committed to expanding and improving this system over the coming years to provide even more features and reliability.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  '~More exciting features coming soon 😁🙃~',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
          ],
        ));
  }
}
