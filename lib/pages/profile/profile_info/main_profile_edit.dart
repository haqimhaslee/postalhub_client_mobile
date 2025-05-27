import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:postalhub_tracker/src/auth_services/auth_services.dart';

//TODO : Edit profile data only (referral data not included-in future update) (pilot)

class ProfileMainEdit extends StatefulWidget {
  const ProfileMainEdit({super.key});

  @override
  State<ProfileMainEdit> createState() => _ProfileMainEditState();
}

class _ProfileMainEditState extends State<ProfileMainEdit> {
  late Future<DocumentSnapshot> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = fetchUserData();
  }

  Future<DocumentSnapshot> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception("User not logged in");
    }
    return FirebaseFirestore.instance.collection('client_user').doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: "Edit profile",
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              year2023: false,
            ));
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.exists) {
            return const Center(
                child: Text('An error occured.\nFailed to load user data.'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ClipOval(
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: data['profilePic'] != null
                              ? NetworkImage(data['profilePic'])
                              : const AssetImage(
                                      'assets/images/profile_image_icon.jpg')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(data['username'] ?? 'Username',
                      style: const TextStyle(fontSize: 25)),
                  Text('UID : ${data['uniqueID'] ?? 'Not set yet'}',
                      style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 25),
                  profileInfoCard(context, data),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget profileInfoCard(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  "Profile info",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              ListTile(
                title: Text(data['username'] ?? ''),
                subtitle: const Text("Name"),
                leading: const Icon(Icons.person_outline_rounded),
              ),
              ListTile(
                title: Text(data['email'] ?? ''),
                subtitle: const Text("Personal email"),
                leading: const Icon(Icons.email_outlined),
              ),
              if (data['phone_no'] != null)
                ListTile(
                  title: Text(data['phone_no'] ?? ''),
                  subtitle: const Text("Phone number"),
                  leading: const Icon(Icons.phone_outlined),
                ),
              if (data['birthday'] != null)
                ListTile(
                  title: Text(data['birthday'] ?? ''),
                  subtitle: const Text("Birthday"),
                  leading: const Icon(Icons.cake_outlined),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
