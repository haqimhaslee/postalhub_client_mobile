import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_library.dart';
import 'package:postalhub_tracker/src/wip_page/not_avail_web.dart';

class ParcelLibraryScaffold extends StatefulWidget {
  const ParcelLibraryScaffold({super.key});
  @override
  State<ParcelLibraryScaffold> createState() => _ParcelLibraryScaffoldState();
}

class _ParcelLibraryScaffoldState extends State<ParcelLibraryScaffold> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Parcel'),
        ),
        body: kIsWeb ? NotAvailWeb() : ParcelLibraryPage());
  }
}
