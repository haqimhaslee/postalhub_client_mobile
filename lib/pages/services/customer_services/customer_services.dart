import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/services/customer_services/faqs/main_faqs_page.dart';

class CustomerServices extends StatelessWidget {
  const CustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar.large(
        title: Text('Help & Support Center'),
      ),
      SliverToBoxAdapter(
          child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 750,
                  ),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Material(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainFaqsPage()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(
                                          Icons.question_answer_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          size: 30,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        // Fixes overflow
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Check out the FAQs",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              softWrap: true,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Look at the frequently asked questions to find answers to common queries in the knowledge base.",
                                              style: TextStyle(fontSize: 15),
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Material(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            Icons.confirmation_num_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          // Fixes overflow
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Ticket Support [COMING SOON]",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                softWrap: true,
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                "Create a case using ticketing system.",
                                                style: TextStyle(fontSize: 15),
                                                softWrap: true,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Material(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            Icons.support_agent_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          // Fixes overflow
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Parcel Mate [COMING SOON]",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                softWrap: true,
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                "Ask any queries to our AI chatbot Parcel Mate. Operate 24/7, anytime, anywhere.",
                                                style: TextStyle(fontSize: 15),
                                                softWrap: true,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Customer Services",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Email",
                              style: TextStyle(fontSize: 13),
                              softWrap: true,
                            ),
                            Row(
                              children: [
                                Text(
                                  "postalhub@gmail.com",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Material(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: InkWell(
                                    child: Text(
                                      "Send Email",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Hotline Service",
                              style: TextStyle(fontSize: 13),
                              softWrap: true,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Not available yet",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Material(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: InkWell(
                                    child: Text(
                                      "Call Us",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              "WhatsApp",
                              style: TextStyle(fontSize: 13),
                              softWrap: true,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Not available yet",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Material(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: InkWell(
                                    child: Text(
                                      "Send Message",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Social Media",
                              style: TextStyle(fontSize: 13),
                              softWrap: true,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Instagram",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Material(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: InkWell(
                                    child: Text(
                                      "Visit",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Facebook",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Material(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: InkWell(
                                    child: Text(
                                      "Visit",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ])))))
    ]));
  }
}
