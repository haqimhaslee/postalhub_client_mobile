import 'package:flutter/material.dart';

class PaymentMethodsMain extends StatefulWidget {
  const PaymentMethodsMain({super.key});
  @override
  State<PaymentMethodsMain> createState() => _PaymentMethodsMainState();
}

class _PaymentMethodsMainState extends State<PaymentMethodsMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment methods'),
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
