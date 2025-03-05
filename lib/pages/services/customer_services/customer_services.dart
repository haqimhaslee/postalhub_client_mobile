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
                text: 'Pending/Active',
                icon: Icon(Icons.pending_rounded),
              ),
              Tab(
                text: 'Solved',
                icon: Icon(Icons.done_all_rounded),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
