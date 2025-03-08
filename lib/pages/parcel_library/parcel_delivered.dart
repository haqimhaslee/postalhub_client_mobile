import 'package:flutter/material.dart';

class ParcelDelivered extends StatelessWidget {
  const ParcelDelivered({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Card(
        child: SizedBox(
          height: 100,
          width: 1000,
        ),
      ),
    ));
  }
}
