import 'package:flutter/material.dart';

class AnnouncementWidget extends StatefulWidget {
  const AnnouncementWidget({super.key});
  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
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
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
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
                            //width: MediaQuery.of(context).size.width - 180,
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
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  child: Material(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 0,
                          bottom: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              //width: MediaQuery.of(context).size.width - 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                "Title",
                                                style: TextStyle(fontSize: 12),
                                              ))),
                                      SizedBox(
                                        height: 100,
                                      ),
                                      SizedBox(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                "Descrpition",
                                                style: TextStyle(fontSize: 12),
                                              ))),
                                      SizedBox(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                "Date",
                                                style: TextStyle(fontSize: 12),
                                              ))),
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
                )
              ],
            )),
          ),
        ),
      ],
    );
  }
}
