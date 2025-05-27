import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/wip_page/not_available_body.dart';

class RewardSystemMain extends StatefulWidget {
  const RewardSystemMain({super.key});
  @override
  State<RewardSystemMain> createState() => _RewardSystemMainState();
}

//TODO: Reward listing ONLY (no reward system yet)

class _RewardSystemMainState extends State<RewardSystemMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Rewards'),
        ),
        body: NotAvailableBody());
  }
}
