import 'package:flutter/material.dart';

class ParcelLibraryPage extends StatefulWidget {
  const ParcelLibraryPage({super.key});

  @override
  State<ParcelLibraryPage> createState() => _ParcelLibraryPageState();
}

class _ParcelLibraryPageState extends State<ParcelLibraryPage> {
  int _value = 0;

  final List<String> _chipLabels = [
    "All",
    "Delivered",
    "On Delivery",
    "Sorted"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Wrap(
          spacing: 5.0,
          children: List<Widget>.generate(_chipLabels.length, (int index) {
            return ChoiceChip(
              label: Text(_chipLabels[index]),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : _value;
                });
              },
            );
          }),
        ),
      ),
      Expanded(
        child: Center(
          child: Text("Selected: ${_chipLabels[_value]}"),
        ),
      )
    ]));
  }
}
