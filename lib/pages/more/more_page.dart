// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:postalhub_tracker/pages/more/about/about.dart';
import 'package:postalhub_tracker/pages/more/how_to_use/how_to_use.dart';
import 'package:postalhub_tracker/pages/more/updates_info/updates_info_at.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  @override
  State<MorePage> createState() => _MorePageState();
}

Future<void> _privacypolicy(BuildContext context) async {
  final theme = Theme.of(context);
  try {
    await launchUrl(
      Uri.parse(
          'https://www.termsfeed.com/live/9187d68f-f1e8-4d89-921f-f8432437ba97'),
      customTabsOptions: CustomTabsOptions(
        colorSchemes: CustomTabsColorSchemes.defaults(
          toolbarColor: theme.colorScheme.surface,
          navigationBarColor: theme.colorScheme.surface,
        ),
        shareState: CustomTabsShareState.off,
        urlBarHidingEnabled: true,
        showTitle: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        preferredBarTintColor: theme.colorScheme.surface,
        preferredControlTintColor: theme.colorScheme.onSurface,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
      ),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<void> _termsandcondition(BuildContext context) async {
  final theme = Theme.of(context);
  try {
    await launchUrl(
      Uri.parse(
          'https://www.termsfeed.com/live/9187d68f-f1e8-4d89-921f-f8432437ba97'),
      customTabsOptions: CustomTabsOptions(
        colorSchemes: CustomTabsColorSchemes.defaults(
          toolbarColor: theme.colorScheme.surface,
          navigationBarColor: theme.colorScheme.surface,
        ),
        shareState: CustomTabsShareState.off,
        urlBarHidingEnabled: true,
        showTitle: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        preferredBarTintColor: theme.colorScheme.surface,
        preferredControlTintColor: theme.colorScheme.onSurface,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
      ),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 158, 158, 158),
      body: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: SizedBox(
                  child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    child: Material(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const About()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                //width: MediaQuery.of(context).size.width - 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text("FAQs",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    child: Material(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UpdatesInfoAt()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                //width: MediaQuery.of(context).size.width - 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text("Release Updates",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    child: Material(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: InkWell(
                        onTap: () => _privacypolicy(context),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                //width: MediaQuery.of(context).size.width - 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text("Privacy Policy",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Material(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: InkWell(
                        onTap: () => _termsandcondition(context),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                //width: MediaQuery.of(context).size.width - 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child:
                                                    Text("Terms & Conditions",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: SizedBox(
                  child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Material(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HowToUse()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                //width: MediaQuery.of(context).size.width - 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text("How to use",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: SizedBox(
                  child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Material(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: InkWell(
                        onTap: () => showLicensePage(
                          context: context,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                //width: MediaQuery.of(context).size.width - 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text("Licences",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
