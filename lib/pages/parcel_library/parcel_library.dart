import 'package:flutter/material.dart';

class ParcelLibraryPage extends StatelessWidget {
  const ParcelLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Parcel Library'),
          bottom: const TabBar(
            isScrollable: true,
            //tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Sorted'),
              Tab(text: 'On Delivery'),
              Tab(text: 'Delivered'),
            ],
          ),
        ),
        body: const ClipRRect(
          child: TabBarView(
            children: [
              Center(
                  child: Text(
                      'This feature only avaiable in mobile version (Account registration required)')),
              Center(
                  child: Text(
                      'This feature only avaiable in mobile version (Account registration required)')),
              Center(
                  child: Text(
                      'This feature only avaiable in mobile version (Account registration required)')),
              Center(
                  child: Text(
                      'This feature only avaiable in mobile version (Account registration required)')),
            ],
          ),
        ),
      ),
    );
  }
}
