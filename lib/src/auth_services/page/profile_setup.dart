// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'dart:io';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSetupState createState() => _ProfileSetupState();
}

typedef ColorEntry = DropdownMenuEntry<ColorLabel>;

// DropdownMenuEntry labels and values for the first dropdown menu.
enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;

  static final List<ColorEntry> entries = UnmodifiableListView<ColorEntry>(
    values.map<ColorEntry>(
      (ColorLabel color) => ColorEntry(
        value: color,
        label: color.label,
      ),
    ),
  );
}

enum SingingCharacter { yes, no }

class _ProfileSetupState extends State<ProfileSetup> {
  int _currentStep = 0;
  File? _imageFile;
  final TextEditingController colorController = TextEditingController();
  ColorLabel? selectedColor;
  bool _isConfirmed = false;
  final int _totalSteps = 3;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _homeAdress = TextEditingController();
  SingingCharacter? _character = SingingCharacter.no;

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
                          ? AssetImage('assets/default_avatar.png')
                              as ImageProvider
                          : AssetImage('assets/images/profile_image_icon.jpg')
                              as ImageProvider),
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
            Text("Campus Refferal",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 25),
            const Text('Register under referral campus?'),
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
            SizedBox(height: 20),
            if (SingingCharacter.yes == _character)
              Column(children: [
                SizedBox(
                    width: double.infinity,
                    child: DropdownMenu<ColorLabel>(
                        leadingIcon: Icon(Icons.apartment),
                        initialSelection: ColorLabel.green,
                        menuStyle: MenuStyle(),
                        controller: colorController,
                        requestFocusOnTap: true,
                        label: const Text('Campus Name'),
                        onSelected: (ColorLabel? color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        dropdownMenuEntries: ColorLabel.entries)),
                SizedBox(height: 15),
                TextField(
                    controller: _homeAdress,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        icon: Icon(Icons.email), labelText: 'Campus Email')),
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

  @override
  Widget build(BuildContext context) {
    double progress = (_currentStep + 1) / _totalSteps;
    if (progress > 1.0) progress = 1.0;

    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                Navigator.pop(context);
              })
        ], title: const Text('Setup your profile')),
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
