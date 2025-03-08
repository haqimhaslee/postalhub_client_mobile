import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/services/customer_services/case_all.dart';
import 'package:postalhub_tracker/pages/services/customer_services/case_pending.dart';
import 'package:postalhub_tracker/pages/services/customer_services/case_solved.dart';

class CustomerServices extends StatelessWidget {
  const CustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Create case'),
          icon: const Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          title: const Text('Customer Service'),
          bottom: TabBar(
            dividerHeight: 0,
            splashBorderRadius: BorderRadius.circular(15),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Pending/Active',
              ),
              Tab(
                text: 'Solved',
              ),
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
              CaseAll(),
              CasePending(),
              CaseSolved(),
            ],
          ),
        ),
      ),
    );
  }
}
