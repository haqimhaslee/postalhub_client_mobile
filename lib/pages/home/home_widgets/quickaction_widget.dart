import 'package:flutter/material.dart';

class QuickactionWidget extends StatefulWidget {
  const QuickactionWidget({super.key});

  @override
  State<QuickactionWidget> createState() => _QuickactionWidgetState();
}

class _QuickactionWidgetState extends State<QuickactionWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Center(
            child: Wrap(
          children: [
            Card(
              elevation: 0,
              child: SizedBox(
                height: 80,
                width: 121,
              ),
            ),
            Card(
              elevation: 0,
              child: SizedBox(
                height: 80,
                width: 121,
              ),
            ),
            Card(
              elevation: 0,
              child: SizedBox(
                height: 80,
                width: 121,
              ),
            )
          ],
        )));
  }
}
