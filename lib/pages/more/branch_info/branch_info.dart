import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BranchInfo extends StatefulWidget {
  const BranchInfo({super.key});
  @override
  State<BranchInfo> createState() => _BranchInfoState();
}

class _BranchInfoState extends State<BranchInfo> {
  late Future<List<Map<String, dynamic>>> _branchesFuture;

  @override
  void initState() {
    super.initState();
    _branchesFuture = _fetchBranches();
  }

  Future<List<Map<String, dynamic>>> _fetchBranches() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('branchManagement').get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch Information'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _branchesFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final branches = snapshot.data;

          if (branches == null || branches.isEmpty) {
            return const Center(child: Text('No branches found.'));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: ListView.builder(
              itemCount: branches.length,
              itemBuilder: (context, index) {
                final data = branches[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text(data['campusName'] ?? 'N/A'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Operating time: ${data['openTime'] ?? 'N/A'} to ${data['closingTime'] ?? 'N/A'}'),
                          Row(
                            children: [
                              const Text("Status: "),
                              data['openStatus'] == true
                                  ? const Text("OPEN")
                                  : const Text("CLOSE"),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          // Add your functionality here
                        },
                        icon: const Icon(Icons.pin_drop_rounded),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
