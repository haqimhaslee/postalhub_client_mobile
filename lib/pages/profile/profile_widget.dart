import 'package:flutter/material.dart';

class ProfileOverviewWidget extends StatefulWidget {
  const ProfileOverviewWidget({super.key});

  @override
  State<ProfileOverviewWidget> createState() => _ProfileOverviewWidgetState();
}

class _ProfileOverviewWidgetState extends State<ProfileOverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Center(
            child: Card(
          //elevation: 5,
          child: SizedBox(
            height: 120,
            width: 600,
          ),
        )));
  }
}
