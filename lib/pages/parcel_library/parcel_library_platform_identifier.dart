import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_library.dart';
import 'package:postalhub_tracker/src/wip_page/not_avail_web.dart';

class ParcelLibraryPlatformIdentifier extends StatelessWidget {
  const ParcelLibraryPlatformIdentifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb ? NotAvailWeb() : ParcelLibraryPage(),
    );
  }
}
