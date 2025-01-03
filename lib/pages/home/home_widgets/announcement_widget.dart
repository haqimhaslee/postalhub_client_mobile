import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('news_announcement').get();
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
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                      ),
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
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "News & Announcements  ",
                                              style: TextStyle(fontSize: 12),
                                            ))),
                                    TextButton(
                                        onPressed: () {},
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
            )),
          ),
        ),
        ...documents.map((doc) {
          return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    child: Material(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 84,
                                    child: Image.network(doc['img_url']),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width < 1000
                                            ? _calculateWidth(context)
                                            : 540,
                                    child: /* Your child widget */
                                        Padding(
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
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                const SizedBox(height: 8.0),
                                                Text(
                                                  doc['description'],

                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w100),

                                                  softWrap:
                                                      true, // This enables text wrapping
                                                  overflow: TextOverflow
                                                      .ellipsis, // Optional: Handles overflow with ellipsis (...)
                                                  maxLines:
                                                      2, // Optional: limits the number of lines
                                                ),
                                              ],
                                            )),
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
