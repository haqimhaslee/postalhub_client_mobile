import 'package:flutter/material.dart';

class PaymentHistoryMain extends StatefulWidget {
  const PaymentHistoryMain({super.key});
  @override
  State<PaymentHistoryMain> createState() => _PaymentHistoryMainState();
}

class _PaymentHistoryMainState extends State<PaymentHistoryMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment history'),
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
