import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:postalhub_tracker/pages/ai_assistant/ai_assistant.dart';
import 'package:postalhub_tracker/pages/more/more_page.dart';
import 'package:postalhub_tracker/pages/search_inventory/search_inventory.dart';
//import 'package:postalhub_tracker/pages/updates_info/updates_info.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key});
  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedIndex = 0;
  final List<Widget> _windgetOption = <Widget>[
    const SearchInventory(),
    const AskOurAi(),
    const MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MediaQuery.of(context).size.width <= 590
            ? NavigationBar(
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerLow,
                height: 70,
                onDestinationSelected: (i) =>
                    setState(() => _selectedIndex = i),
                selectedIndex: _selectedIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.hub),
                    label: 'Ask AI',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.more_horiz_rounded),
                    label: 'More',
                  ),
                ],
              )
            : null,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_rounded),
              tooltip: 'Newsletter (Coming Soon)',
              onPressed: () {},
            ),
            const SizedBox(
              width: 8,
            ),
          ],
          title: Row(children: [
            Image.asset(
              'assets/images/postalhub_logo.jpg',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const Text('  Campus Postal Hub'),
          ]),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (MediaQuery.of(context).size.width > 590 &&
                MediaQuery.of(context).size.width <= 810)
              NavigationRail(
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerLow,
                selectedIndex: _selectedIndex,
                groupAlignment: 0,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.all,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.search),
                    label: Text('Search'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.hub),
                    label: Text('Ask AI'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.more_horiz_rounded),
                    label: Text('More'),
                  ),
                ],
              ),
            if (MediaQuery.of(context).size.width > 810)
              NavigationDrawer(
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerLow,
                onDestinationSelected: (i) =>
                    setState(() => _selectedIndex = i),
                selectedIndex: _selectedIndex,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(28, 16, 16, 0),
                  ),
                  NavigationDrawerDestination(
                    label: Text('Search'),
                    icon: Icon(Icons.search),
                  ),
                  NavigationDrawerDestination(
                    label: Text('Ask AI'),
                    icon: Icon(Icons.hub),
                  ),
                  NavigationDrawerDestination(
                    label: Text('More'),
                    icon: Icon(Icons.more_horiz_rounded),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
                    child: Divider(),
                  ),
                ],
              ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      MediaQuery.of(context).size.width > 590 ? 40 : 25),
                  topRight: Radius.circular(
                      MediaQuery.of(context).size.width > 590 ? 0 : 25),
                  bottomLeft: Radius.circular(
                      MediaQuery.of(context).size.width > 590 ? 0 : 25),
                  bottomRight: Radius.circular(
                      MediaQuery.of(context).size.width > 590 ? 0 : 25),
                ),
                child: PageTransitionSwitcher(
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      SharedAxisTransition(
                    fillColor:
                        Theme.of(context).colorScheme.surfaceContainerLowest,
                    transitionType: SharedAxisTransitionType.vertical,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  ),
                  child: _windgetOption.elementAt(_selectedIndex),
                ),
              ),
            )
          ],
        ));
  }
}
