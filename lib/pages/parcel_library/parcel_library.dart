import 'package:flutter/material.dart';

class ParcelLibraryPage extends StatelessWidget {
  const ParcelLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            dividerHeight: 1,
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
                  child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This feature only avaiable in mobile version. \n (Account registration required)',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
              Center(
                  child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This feature only avaiable in mobile version. \n (Account registration required)',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
              Center(
                  child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This feature only avaiable in mobile version. \n (Account registration required)',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
              Center(
                  child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This feature only avaiable in mobile version. \n (Account registration required)',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
