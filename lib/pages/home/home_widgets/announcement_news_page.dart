import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AnnouncementNewsPage extends StatefulWidget {
  const AnnouncementNewsPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AnnouncementNewsPageState createState() => _AnnouncementNewsPageState();
}

class _AnnouncementNewsPageState extends State<AnnouncementNewsPage> {
  List<DocumentSnapshot> documents = [];
  bool isLoading = false;
  bool hasMore = true;
  DocumentSnapshot? lastDocument;
  final int limit = 8;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          hasMore) {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    Query query = FirebaseFirestore.instance
        .collection('news_announcement')
        .orderBy('date', descending: true)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument!);
    }

    QuerySnapshot querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      lastDocument = querySnapshot.docs.last;
      setState(() {
        documents.addAll(querySnapshot.docs);
        hasMore = querySnapshot.docs.length == limit;
      });
    } else {
      setState(() => hasMore = false);
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - 190;
    return Scaffold(
      appBar: AppBar(
        title: const Text("News & Announcements"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: documents.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == documents.length) {
            return const Center(child: CircularProgressIndicator());
          }

          final doc = documents[index];
          final DateTime date = (doc['date'] as Timestamp).toDate();
          final String formattedDate = DateFormat('dd/MM/yyyy').format(date);

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
                            date: formattedDate,
                          ),
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
                                width: 160,
                                height: 90,
                                child: Image.network(doc['img_url'],
                                    fit: BoxFit.cover),
                              ),
                              SizedBox(
                                width: screenWidth,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      const SizedBox(height: 5.0),
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
                ),
              ),
            ),
          );
        },
      ),
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
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text(date,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ));
  }
}
