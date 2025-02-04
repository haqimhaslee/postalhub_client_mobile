import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/announcement_news_page.dart';
import 'package:intl/intl.dart';

class AnnouncementWidget extends StatefulWidget {
  const AnnouncementWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AnnouncementWidgetState createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  List<DocumentSnapshot> documents = [];

  double _calculateWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 590) {
      return screenWidth - 200;
    } else if (screenWidth <= 700) {
      return screenWidth - 300;
    } else if (screenWidth <= 809) {
      return screenWidth - 260;
    } else {
      return screenWidth - 482;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('news_announcement')
        .orderBy('date', descending: true)
        .limit(4)
        .get();
    setState(() {
      documents = querySnapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: SizedBox(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    child: Material(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                "News & Announcements  ",
                                                style: TextStyle(fontSize: 12),
                                              ))),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AnnouncementNewsPage()));
                                          },
                                          child: const Text(
                                            'More',
                                            style: TextStyle(fontSize: 11),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ...documents.map((doc) {
          Timestamp timestamp = doc['date'];
          String formattedDate =
              DateFormat('d/M/yyyy').format(timestamp.toDate());
          return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Material(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnnouncementDetailPage(
                                  title: doc['title'],
                                  description: doc['description'],
                                  imageUrl: doc['img_url'],
                                  date: formattedDate),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 83,
                                    child: Image.network(doc['img_url'],
                                        fit: BoxFit.cover),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width < 1000
                                            ? _calculateWidth(context)
                                            : 540,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            doc['title'],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          const SizedBox(height: 5.0),
                                          Text(
                                            doc['description'],
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w100),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          const SizedBox(height: 2.0),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.calendar_month_rounded,
                                                size: 11.5,
                                              ),
                                              const Text('  '),
                                              Text(
                                                formattedDate,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ));
        }),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 600,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(imageUrl),
                      ),
                    ),
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
                  const SizedBox(height: 8.0),
                  const Divider(),
                  const SizedBox(height: 8.0),
                  Text(description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ));
  }
}
