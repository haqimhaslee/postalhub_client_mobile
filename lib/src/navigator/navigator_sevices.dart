import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'dart:math';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:postalhub_tracker/pages/ai_assistant/ai_assistant.dart';
import 'package:postalhub_tracker/pages/home/home.dart';
import 'package:postalhub_tracker/pages/more/more_page.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_library.dart';
import 'package:postalhub_tracker/pages/search_inventory/search_inventory.dart';
import 'package:postalhub_tracker/pages/services/services.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key});

  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedIndex = 0;
  final List<Widget> _windgetOption = <Widget>[
    const HomePage(),
    const ParcelLibraryPage(),
    const SearchInventory(),
    const ServicesPage(),
    const MorePage(),
  ];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                shape: BoxShape.rectangle,
                gradient: SweepGradient(
                  colors: const [
                    Colors.blue,
                    Colors.red,
                    Colors.blue,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                  transform:
                      GradientRotation(_animationController.value * 2 * pi),
                ),
              ),
              padding: const EdgeInsets.all(2.5), // Border thickness
              child: FloatingActionButton(
                //shape: const CircleBorder(),
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AskOurAi()));
                },
                tooltip: 'Ask AI',
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerLowest,
                child: Icon(
                  LucideIcons.bot,
                  size: 28,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width <= 590
            ? NavigationBar(
                onDestinationSelected: (i) =>
                    setState(() => _selectedIndex = i),
                selectedIndex: _selectedIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    icon: Icon(Icons.home_rounded),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.inventory_2_rounded),
                    label: 'My Parcel',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search_rounded),
                    label: 'Search',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.widgets_rounded),
                    label: 'Services',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.more_horiz_rounded),
                    label: 'More',
                  ),
                ],
              )
            : null,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (MediaQuery.of(context).size.width > 590 &&
                MediaQuery.of(context).size.width <= 810)
              NavigationRail(
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
                    icon: Icon(Icons.home_rounded),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.inventory_2_rounded),
                    label: Text('My Parcel'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search_rounded),
                    label: Text('Search'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.widgets_rounded),
                    label: Text('Services'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.more_horiz_rounded),
                    label: Text('More'),
                  ),
                ],
              ),
            if (MediaQuery.of(context).size.width > 810)
              NavigationDrawer(
                onDestinationSelected: (i) =>
                    setState(() => _selectedIndex = i),
                selectedIndex: _selectedIndex,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(28, 16, 16, 0),
                  ),
                  NavigationDrawerDestination(
                    label: Text('Home'),
                    icon: Icon(Icons.home_rounded),
                  ),
                  NavigationDrawerDestination(
                    label: Text('My Parcel'),
                    icon: Icon(Icons.inventory_2_rounded),
                  ),
                  NavigationDrawerDestination(
                    label: Text('Search'),
                    icon: Icon(Icons.search),
                  ),
                  NavigationDrawerDestination(
                    label: Text('Services'),
                    icon: Icon(Icons.widgets_rounded),
                  ),
                  NavigationDrawerDestination(
                    label: Text('More'),
                    icon: Icon(Icons.more_horiz_rounded),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
                    child: Divider(),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
                      child: Text(
                        "Copyright Campus Postal Hub © 2024 - 2025",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 0, 28, 16),
                      child: Text(
                        "All rights reserved",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            Expanded(
              child: PageTransitionSwitcher(
                transitionBuilder: (child, animation, secondaryAnimation) =>
                    SharedAxisTransition(
                  transitionType: SharedAxisTransitionType.vertical,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                ),
                child: _windgetOption.elementAt(_selectedIndex),
              ),
            ),
          ],
        ));
  }
}
