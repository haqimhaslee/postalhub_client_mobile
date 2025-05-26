import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/profile/profile_info/main_profile.dart';
import 'package:postalhub_tracker/src/wip_page/not_avail_web.dart';

class ProfileInfoPlatformIdentifier extends StatefulWidget {
  const ProfileInfoPlatformIdentifier({super.key});
  @override
  State<ProfileInfoPlatformIdentifier> createState() =>
      _ProfileInfoPlatformIdentifierState();
}

class _ProfileInfoPlatformIdentifierState
    extends State<ProfileInfoPlatformIdentifier> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code
    return Scaffold(body: kIsWeb ? NotAvailWeb() : ProfileMain());
  }
}
