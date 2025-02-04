// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/announcement_widget.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/carousel_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 158, 158, 158),
      body: ListView(
        children: const [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
                  child: ClipRRect(
                    child: SizedBox(
                      width: 600,
                      child: CarouselAds(),
                    ),
                  ))
            ],
          ),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ClipRRect(
                    child: SizedBox(
                      width: 700,
                      child: AnnouncementWidget(),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
