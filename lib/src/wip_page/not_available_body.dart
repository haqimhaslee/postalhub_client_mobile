import 'package:flutter/material.dart';

class NotAvailableBody extends StatefulWidget {
  const NotAvailableBody({super.key});
  @override
  State<NotAvailableBody> createState() => _NotAvailableBodyState();
}

class _NotAvailableBodyState extends State<NotAvailableBody> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/components/not_available.png",
            scale: 3,
          ),
          Text(
            'Not available yet',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 13,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
