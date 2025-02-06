import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

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
  final int limit = 5;
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
    // final screenWidth = MediaQuery.of(context).size.width - 190;
    return Scaffold(
      appBar: AppBar(
        title: const Text("News & Announcements"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: documents.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == documents.length) {
            return Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: const Duration(milliseconds: 1500),
              baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
              highlightColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              child: const Card(
                  elevation: 0,
                  child: SizedBox(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                    ),
                  )),
            );
          }

          final doc = documents[index];
          final DateTime date = (doc['date'] as Timestamp).toDate();
          final String formattedDate =
              DateFormat('d/M/yyyy, h:mm a').format(date);

          return Column(
            children: [
              ListTile(
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
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: 600,
                        height: 200,
                        child: Image.network(doc['img_url'], fit: BoxFit.cover),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 13, 0, 5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/postalhub_logo.jpg'),
                              radius: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                'Postal Hub',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                ),
                                softWrap: true,
                                //overflow: TextOverflow.ellipsis,
                                //maxLines: 1,
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        doc['title'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            wordSpacing: 2),
                        softWrap: true,
                        //overflow: TextOverflow.ellipsis,
                        //maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0), child: Divider())
            ],
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
