import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/search_inventory/search_inventory.dart';
import 'package:postalhub_tracker/pages/services/customer_services/customer_services.dart';
import 'package:postalhub_tracker/pages/services/locations/locations_main.dart';
import 'package:postalhub_tracker/pages/services/smart_locker/smart_locker_main.dart';

class QuickactionWidget extends StatefulWidget {
  const QuickactionWidget({super.key});

  @override
  State<QuickactionWidget> createState() => _QuickactionWidgetState();
}

class _QuickactionWidgetState extends State<QuickactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Material(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SearchInventory()));
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.search_rounded,
                                            size: 30,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Find",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      )))))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Material(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LocationsMain()));
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.pin_drop_outlined,
                                            size: 30,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Locations",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      )))))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Material(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SmartLockerMain()));
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.kitchen_outlined,
                                            size: 30,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Locker",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      )))))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Material(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CustomerServices()));
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.help_outline_rounded,
                                            size: 30,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Help",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      )))))),
                ],
              ),
            )));
  }
}
