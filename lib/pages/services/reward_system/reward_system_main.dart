import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

class RewardSystemMain extends StatefulWidget {
  const RewardSystemMain({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RewardSystemMainState createState() => _RewardSystemMainState();
}

class _RewardSystemMainState extends State<RewardSystemMain> {
  List<DocumentSnapshot> documents = [];
  bool isLoading = false;
  bool hasMore = true;
  DocumentSnapshot? lastDocument;
  final int limit = 5;
  final ScrollController _scrollController = ScrollController();
  DocumentSnapshot? selectedDocument;

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          hasMore) {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    Query query =
        FirebaseFirestore.instance.collection('rewardLibrary').limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument!);
    }

    QuerySnapshot querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      lastDocument = querySnapshot.docs.last;
      setState(() {
        documents.addAll(querySnapshot.docs);
        hasMore = querySnapshot.docs.length == limit;
      });
    } else {
      setState(() => hasMore = false);
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rewards")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth >= 900;

          return Row(
            children: [
              // List View Pane
              Expanded(
                flex: 2,
                child: buildListView(isLargeScreen),
              ),
              // Detail View Pane (only for large screens)
              if (isLargeScreen) const VerticalDivider(width: 1, thickness: 1),
              if (isLargeScreen)
                Expanded(
                  flex: 3,
                  child: selectedDocument != null
                      ? RewardDetailPage(
                          title: selectedDocument!['rewardTitle'],
                          description: selectedDocument!['rewardDescription'],
                          imageUrl: selectedDocument!['rewardImage'],
                          rewardPointValue:
                              selectedDocument!['rewardPointValue'],
                        )
                      : const Center(child: Text(" ")),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget buildListView(bool isLargeScreen) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 550),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: documents.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == documents.length) {
              return shimmerPlaceholder();
            }

            final doc = documents[index];

            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Material(
                            child: InkWell(
                                onTap: () {
                                  if (isLargeScreen) {
                                    setState(() => selectedDocument = doc);
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RewardDetailPage(
                                          title: doc['rewardTitle'],
                                          description: doc['rewardDescription'],
                                          imageUrl: doc['rewardImage'],
                                          rewardPointValue:
                                              doc['rewardPointValue'],
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: SizedBox(
                                          width: 500,
                                          height: 200,
                                          child: Image.network(
                                              doc['rewardImage'],
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        doc['rewardTitle'],
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        softWrap: true,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        doc['rewardDescription'],
                                        style: TextStyle(fontSize: 15),
                                        softWrap: true,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 9),
                                      if (doc['rewardLimited'] == true)
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  child: Material(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                5, 2, 5, 2),
                                                        child: Text(
                                                          "LIMITED AVAILABILITY",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimaryContainer,
                                                          ),
                                                        )),
                                                  )),
                                            ),
                                            SizedBox(height: 8),
                                          ],
                                        ),
                                      Row(
                                        children: [
                                          Icon(Icons.local_activity_outlined,
                                              size: 18,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          SizedBox(width: 5),
                                          Text(
                                            doc['rewardPointValue'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "pts",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))))),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget shimmerPlaceholder() {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Card(
        elevation: 0,
        child: SizedBox(
          child: AspectRatio(aspectRatio: 16 / 9),
        ),
      ),
    );
  }
}

class RewardDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String rewardPointValue;

  const RewardDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rewardPointValue,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: screenWidth >= 900
            ? null
            : AppBar(
                title: Text('Reward Details'),
              ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: ListView(
              padding: const EdgeInsets.all(15.0),
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(imageUrl),
                ),
                const SizedBox(height: 10.0),
                Text(title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.local_activity_outlined,
                        size: 18, color: Theme.of(context).colorScheme.primary),
                    SizedBox(width: 5),
                    Text(
                      rewardPointValue,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "pts",
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Divider(),
                const SizedBox(height: 8.0),
                Text(description, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 15.0),
                FilledButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Text("Claim Reward",
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
