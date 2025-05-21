import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/wip_page/not_available_body.dart';

class ProfileEcard extends StatefulWidget {
  const ProfileEcard({super.key});
  @override
  State<ProfileEcard> createState() => _ProfileEcardState();
}

class _ProfileEcardState extends State<ProfileEcard> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Digital Card'),
        ),
        body: NotAvailableBody());
  }
}
