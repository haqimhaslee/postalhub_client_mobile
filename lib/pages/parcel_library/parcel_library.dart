import 'package:flutter/material.dart';

class ParcelLibraryPage extends StatelessWidget {
  const ParcelLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
            title: const TabBar(
              //isScrollable: true,
              //tabAlignment: TabAlignment.start,
              dividerHeight: 0,
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Sorted'),
                Tab(text: 'On Delivery'),
                Tab(text: 'Delivered'),
              ],
            ),
          ),
          body: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    MediaQuery.of(context).size.width > 590 ? 40 : 25),
                topRight: Radius.circular(
                    MediaQuery.of(context).size.width > 590 ? 40 : 25),
                bottomLeft: Radius.circular(
                    MediaQuery.of(context).size.width > 590 ? 0 : 0),
                bottomRight: Radius.circular(
                    MediaQuery.of(context).size.width > 590 ? 0 : 0),
              ),
              child: Container(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainerLowest, // Set your desired color here
                child: const TabBarView(
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
          )),
    );
  }
}
