// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:collection/collection.dart';

import 'dart:io';

import 'package:postalhub_tracker/src/auth_services/auth_services.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSetupState createState() => _ProfileSetupState();
}

// DropdownMenuEntry labels and values for the first dropdown menu.

enum SingingCharacter { yes, no }

class _ProfileSetupState extends State<ProfileSetup> {
  int _currentStep = 0;
  File? _imageFile;
  final TextEditingController colorController = TextEditingController();
  bool _isConfirmed = false;
  final int _totalSteps = 3;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _homeAdress = TextEditingController();
  SingingCharacter? _character = SingingCharacter.no;
  String? _imgUrl;
  List<String> campusNames = [];
  String? selectedCampusName;

  List<Step> _buildSteps() {
    return [
      Step(
        title: const Text('1'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text("Basic Information",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!) as ImageProvider
                        : (_imgUrl != null
                                ? NetworkImage(_imgUrl!)
                                : const AssetImage(
                                    'assets/images/profile_image_icon.jpg'))
                            as ImageProvider,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle),
                        child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            iconSize: 20,
                            color: Theme.of(context).colorScheme.onPrimary,
                            onPressed: () {}),
                      ))
                ],
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: _name,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
              decoration:
                  InputDecoration(icon: Icon(Icons.person), labelText: 'Name'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _phone,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  icon: Icon(Icons.phone), labelText: 'Phone Number'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _homeAdress,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  icon: Icon(Icons.location_on_outlined), labelText: 'Address'),
            ),
            SizedBox(height: 20),
            Divider()
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.editing,
      ),
      Step(
          title: const Text('2'),
          content:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 5),
            Text("Campus/Company Refferal",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 20),
            const Text('Register under referral campus/company?'),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  child: Row(children: [
                Radio<SingingCharacter>(
                    value: SingingCharacter.yes,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                        if (kDebugMode) {
                          print('Selected: $_character');
                        }
                      });
                    }),
                const Text('Yes')
              ])),
              SizedBox(width: 30),
              SizedBox(
                  child: Row(children: [
                Radio<SingingCharacter>(
                    value: SingingCharacter.no,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                        if (kDebugMode) {
                          print('Selected: $_character');
                        }
                      });
                    }),
                const Text('No')
              ]))
            ]),
            SizedBox(height: 5),
            Divider(),
            if (SingingCharacter.yes == _character)
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 10),
                Text("Campus/Company Details",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w900)),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.apartment_outlined),
                      labelText: 'Name',
                    ),
                    value: selectedCampusName,
                    isExpanded: true, // This prevents overflow
                    items: campusNames.map((name) {
                      return DropdownMenuItem<String>(
                        value: name,
                        child: Text(
                          name,
                          overflow:
                              TextOverflow.ellipsis, // Prevent text overflow
                          softWrap: false,
                          maxLines: 1,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCampusName = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                    controller: _homeAdress,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        icon: Icon(Icons.badge_outlined), labelText: 'ID')),
                SizedBox(height: 15),
                TextField(
                    controller: _homeAdress,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        icon: Icon(Icons.email_outlined), labelText: 'Email')),
                SizedBox(height: 15),
                TextField(
                    controller: _homeAdress,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        icon: Icon(Icons.location_on_outlined),
                        labelText: 'Room/Desk Address')),
                SizedBox(height: 20),
                Divider()
              ])
          ]),
          isActive: _currentStep >= 1,
          state: _currentStep > 1 ? StepState.complete : StepState.editing),
      Step(
          title: const Text('Confirm'),
          content:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 5),
            Text("Confirmation",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 20),
            const Text('I confirm that the given information is correct.'),
            SizedBox(height: 15),
            Row(children: [
              Checkbox(
                  value: _isConfirmed,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isConfirmed = newValue ?? false;
                      if (kDebugMode) {
                        print('Checkbox is checked: $_isConfirmed');
                      }
                    });
                  }),
              const Text('Yes, I confirmed.')
            ]),
            SizedBox(height: 13),
            if (_isConfirmed == true)
              Column(children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    child: Text('Submit & complete setup',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary))),
                SizedBox(height: 13)
              ]),
            Divider()
          ]),
          isActive: _currentStep >= 2,
          state: _currentStep == 2 ? StepState.editing : StepState.disabled)
    ];
  }

  Future<void> loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('client_user') // change if your collection name differs
          .doc(user.uid)
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        setState(() {
          _name.text = data['username'] ?? '';
          _phone.text = data['phone'] ?? '';
          _homeAdress.text = data['address'] ?? '';
          _character = (data['referred'] == true)
              ? SingingCharacter.yes
              : SingingCharacter.no;
          _imgUrl = data['profilePic'];
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading user data: $e');
      }
    }
  }

  Future<void> fetchReferralCampuses() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('referral_Campus').get();

      final names = snapshot.docs
          .map((doc) => doc['campusName']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .toList();

      setState(() {
        campusNames = names;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching referral campuses: $e');
      }
    }
  }

  Future<void> logout() async {
    try {
      await AuthService.logout();
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
    fetchReferralCampuses();
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentStep + 1) / _totalSteps;
    if (progress > 1.0) progress = 1.0;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Setup your profile'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) async {
                switch (value) {
                  case 'logout':
                    final shouldLogout = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true); // return true
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                    );
                    if (shouldLogout == true) {
                      logout();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                    break;
                  case 'info':
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'info',
                  child: Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Info'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 12,
                        ),
                        Text('Log out'),
                      ],
                    )),
              ],
            ),
          ],
        ),
        body: Column(children: [
          LinearProgressIndicator(year2023: false, value: progress),
          Expanded(
              child: Stepper(
                  type: StepperType.horizontal,
                  physics: const ClampingScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (int step) {
                    setState(() {
                      _currentStep = step;
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                      _currentStep += 1;
                    });
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep -= 1;
                      });
                    }
                  },
                  steps: _buildSteps(),
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(children: <Widget>[
                          if (_currentStep != 2)
                            ElevatedButton(
                                onPressed: details.onStepContinue,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary),
                                child: Text('Continue',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary))),
                          if (_currentStep != 2) SizedBox(width: 10),
                          if (_currentStep != 0)
                            ElevatedButton(
                                onPressed: details.onStepCancel,
                                child: const Text('Back'))
                        ]));
                  }))
        ]));
  }
}
