import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:postalhub_tracker/src/auth_services/auth_services.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

Future<void> logout() async {
  try {
    await AuthService.logout();
  } catch (e) {
    if (kDebugMode) {
      print("Error during logout: $e");
    }
  }
}

class _ProfileMainState extends State<ProfileMain> {
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
                  campusInfoCard(context, data),
                  logoutTile(context),
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

  Widget campusInfoCard(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: data['campusName'] != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Row(
                        children: [
                          Text(
                            "Campus/Company details",
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.info_outline_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(data['campusName'] ?? ''),
                      subtitle: const Text("Campus/Company name"),
                      leading: const Icon(Icons.work_outline_rounded),
                    ),
                    ListTile(
                      title: Text(data['campusId'] ?? ''),
                      subtitle: const Text("Campus/Company ID"),
                      leading: const Icon(Icons.badge_outlined),
                    ),
                    ListTile(
                      title: Text(data['campusRoomAddress'] ?? ''),
                      subtitle: const Text("Room/Desk address"),
                      leading: const Icon(Icons.pin_drop_outlined),
                    ),
                    ListTile(
                      title: Text(data['campusEmail'] ?? ''),
                      subtitle: const Text("Campus/Company email"),
                      leading: const Icon(Icons.email_outlined),
                    ),
                  ],
                )
              : null,
        ),
      ),
    );
  }

  Widget logoutTile(BuildContext context) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Icon(Icons.logout_outlined, color: Colors.red),
      ),
      title: const Text('Log Out', style: TextStyle(color: Colors.red)),
      onTap: () async {
        final shouldLogout = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Row(
              children: const [
                Icon(Icons.login_rounded),
                SizedBox(width: 15),
                Text('Logout'),
              ],
            ),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child:
                    const Text('Logout', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );

        if (shouldLogout == true) {
          await logout();
        }
      },
    );
  }
}
