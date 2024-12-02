import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BranchInfo extends StatefulWidget {
  const BranchInfo({super.key});
  @override
  State<BranchInfo> createState() => _BranchInfoState();
}

class _BranchInfoState extends State<BranchInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Branch Info"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('branchManagement')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No branches found.'));
          }

          return Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 15,
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot document = snapshot.data!.docs[index];
                  final data = document.data() as Map<String, dynamic>;

                  return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          title: Text(data['campusName'] ??
                              'N/A'), // Handle null values
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
                                      : const Text("CLOSE")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ));
        },
      ),
    );
  }
}
