import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_all.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_delivered.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_onDelivery.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_sorted.dart';

class ParcelLibraryPage extends StatelessWidget {
  const ParcelLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          title: TabBar(
            dividerHeight: 0,
            splashBorderRadius: BorderRadius.circular(15),
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Sorted'),
              Tab(text: 'On Delivery'),
              Tab(text: 'Delivered'),
            ],
          ),
        ),
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              screenWidth < 590 ? 20 : 30,
            ),
            topRight: Radius.circular(
              screenWidth < 590 ? 20 : 0,
            ),
            bottomLeft: Radius.circular(
              screenWidth < 590 ? 20 : 0,
            ),
            bottomRight: Radius.circular(
              screenWidth < 590 ? 20 : 0,
            ),
          ),
          child: const TabBarView(
            children: [
              ParcelAll(),
              ParcelSorted(),
              ParcelOndelivery(),
              ParcelDelivered()
            ],
          ),
        ),
      ),
    );
  }
}
