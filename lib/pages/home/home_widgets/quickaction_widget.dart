import 'package:flutter/material.dart';

class QuickactionWidget extends StatefulWidget {
  const QuickactionWidget({super.key});

  @override
  State<QuickactionWidget> createState() => _QuickactionWidgetState();
}

class _QuickactionWidgetState extends State<QuickactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    "Quick Actions",
                    style: TextStyle(
                      fontSize: 23,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 25,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              Card(
                elevation: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  height: 80,
                  width: 121,
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  height: 80,
                  width: 121,
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  height: 80,
                  width: 121,
                ),
              ),
            ],
          )
        ]));
  }
}
