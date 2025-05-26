import 'package:flutter/material.dart';
//import 'package:postalhub_tracker/pages/services/customer_services/case_all.dart';
//import 'package:postalhub_tracker/pages/services/customer_services/case_pending.dart';
//import 'package:postalhub_tracker/pages/services/customer_services/case_solved.dart';
import 'package:postalhub_tracker/src/wip_page/not_available_body.dart';

class CustomerServices extends StatelessWidget {
  const CustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Create case'),
          icon: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Help & Support Center'),
          bottom: TabBar(
            dividerHeight: 0,
            splashBorderRadius: BorderRadius.circular(15),
            isScrollable: true,
            tabs: const [
              Tab(
                text: 'Knowledge Base',
              ),
              Tab(
                text: 'Case',
              ),
            ],
          ),
        ),
        body: const ClipRRect(
          child: TabBarView(
            children: [
              NotAvailableBody(),
              NotAvailableBody(),
              //CasePending(),
              //CaseSolved(),
            ],
          ),
        ),
      ),
    );
  }
}
