import 'package:flutter/material.dart';

class CustomerServices extends StatelessWidget {
  const CustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Create case'),
          icon: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Customer Service'),
          bottom: const TabBar(
            //isScrollable: true,
            //tabAlignment: TabAlignment.start,
            tabs: [
              Tab(
                text: 'All',
                icon: Icon(Icons.clear_all_rounded),
              ),
              Tab(
                text: 'Pending',
                icon: Icon(Icons.pending_rounded),
              ),
              Tab(
                text: 'Closed',
                icon: Icon(Icons.done_all_rounded),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
