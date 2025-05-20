// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:postalhub_tracker/src/auth_services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();
  bool _obscureText = true;
  bool _isRegistering = false;
  bool _isRegisteringWithGoogle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Image.asset(
              "assets/images/login/register.png",
              width: 428,
              height: 428,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _emailController,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 147,
                      child: TextField(
                        obscureText: _obscureText,
                        obscuringCharacter: '*',
                        controller: _passController,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Create Password',
                          hintStyle: TextStyle(
                            //color: Color(0xFF837E93),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 147,
                      child: TextField(
                        obscureText: _obscureText,
                        obscuringCharacter: '*',
                        controller: _repassController,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          // color: Color(0xFF393939),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            //color: Color(0xFF837E93),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: !_obscureText, // Inverted here
                      onChanged: (bool? value) {
                        setState(() {
                          _obscureText = !value!; // Inverted here too
                        });
                      },
                    ),
                    const Text(
                      'Show password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    width: 329,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final email = _emailController.text.trim();
                        final password = _passController.text;
                        final confirmPassword = _repassController.text;
                        final username = email.split('@')[0];
                        if (password != confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Passwords do not match")),
                          );
                          return;
                        }

                        try {
                          setState(() {
                            _isRegistering = true;
                          });
                          await AuthService.register(
                            email: email,
                            password: password,
                            username: username,
                          );
                          setState(() {
                            _isRegistering = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Account created successfully")),
                          );
                          Navigator.pop(context);
                        } catch (e) {
                          setState(() {
                            _isRegistering = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: _isRegistering
                          ? CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                              year2023: false,
                            )
                          : Text(
                              'Create account',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("or"),
                ),
                const SizedBox(
                  height: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                      width: 329,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () async {
                          try {
                            setState(() {
                              _isRegisteringWithGoogle = true;
                            });
                            final userCredential =
                                await AuthService.signInWithGoogle();
                            setState(() {
                              _isRegisteringWithGoogle = false;
                            });
                            Navigator.pop(
                                context, true); // return true to previous route
                            Navigator.of(context).popUntil(
                                (route) => route.isFirst); // go to root
                            if (kDebugMode) {
                              print(
                                  'Signed in: ${userCredential.user?.displayName}');
                            }
                          } catch (e) {
                            setState(() {
                              _isRegisteringWithGoogle = false;
                            });
                            if (kDebugMode) {
                              print('Google Sign-In Error: $e');
                            }
                          }
                        },
                        style: OutlinedButton.styleFrom(),
                        child: _isRegisteringWithGoogle
                            ? CircularProgressIndicator(
                                year2023: false,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign up with Google   |   ',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/logo/google_logo.webp",
                                    height: 23,
                                  ),
                                ],
                              ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      ' Have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //color: Color(0xFF837E93),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' Log In ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
