import 'package:flutter/material.dart';

class PointsHistory extends StatefulWidget {
  const PointsHistory({super.key});
  @override
  State<PointsHistory> createState() => _PointsHistoryState();
}

class _PointsHistoryState extends State<PointsHistory> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Points history'),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              child: ListView(
                children: const [
                  Center(
                    child: Text('Coming soon'),
                  )
                ],
              ),
            )));
  }
}
