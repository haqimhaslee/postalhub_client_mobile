import 'package:flutter/material.dart';

class ProfileOverviewWidget extends StatefulWidget {
  const ProfileOverviewWidget({super.key});

  @override
  State<ProfileOverviewWidget> createState() => _ProfileOverviewWidgetState();
}

class _ProfileOverviewWidgetState extends State<ProfileOverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/profile_image_icon.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )),
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('<username>'),
                                          Text('<id>'),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 600,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_card.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 5),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/postalhub_logo.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          const Text(
                                            'POSTAL POINTS',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'POINTS',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Material(
                                            color: const Color.fromARGB(
                                                38, 255, 255, 255),
                                            child: InkWell(
                                              onTap: () {},
                                              child: const SizedBox(
                                                width: 166,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 8, 0, 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                          Icons
                                                              .history_outlined,
                                                          color: Colors.white),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'History',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Material(
                                            color: const Color.fromARGB(
                                                38, 255, 255, 255),
                                            child: InkWell(
                                              onTap: () {},
                                              child: const SizedBox(
                                                width: 166,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 8, 0, 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                          Icons.redeem_outlined,
                                                          color: Colors.white),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'Redeem',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 15, 10, 17),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                        width: 595,
                                        height: 45,
                                        color: Colors.white,
                                        child: const Center(
                                          child: Text(
                                            'Bar code',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        )),
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
