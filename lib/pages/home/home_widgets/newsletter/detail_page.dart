import 'package:flutter/material.dart';

class AnnouncementDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String date;

  const AnnouncementDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(imageUrl),
                ),
                const SizedBox(height: 10.0),
                Text(title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded, size: 16),
                    const SizedBox(width: 4),
                    Text(date,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ],
                ),
                const Divider(),
                Text(description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ));
  }
}
