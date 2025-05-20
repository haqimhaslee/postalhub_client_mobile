// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/auth_services/page/forgot_pass.dart';
import 'package:postalhub_tracker/src/auth_services/page/register.dart';
import 'package:postalhub_tracker/src/auth_services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _obscureText = true;
  bool _isSigninIn = false;
  bool _isSigninInWithGoogle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Image.asset("assets/images/login/login.png",
                              width: 413, height: 413)),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                              textDirection: TextDirection.ltr,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Log In',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w900)),
                                const SizedBox(height: 15),
                                TextField(
                                    controller: _emailController,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600))),
                                const SizedBox(height: 15),
                                TextField(
                                    obscureText: _obscureText,
                                    obscuringCharacter: '*',
                                    controller: _passController,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                            icon: Icon(_obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility)),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600))),
                                const SizedBox(height: 20),
                                ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: SizedBox(
                                        width: 329,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final email =
                                                _emailController.text.trim();
                                            final password =
                                                _passController.text.trim();

                                            if (email.isEmpty ||
                                                password.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Please enter both email and password.'),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                              return;
                                            }

                                            try {
                                              setState(() {
                                                _isSigninIn = true;
                                              });
                                              await AuthService.login(
                                                  email: email,
                                                  password: password);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text('Login successful!'),
                                                  backgroundColor: Colors.green,
                                                ),
                                              );
                                              setState(() {
                                                _isSigninIn = false;
                                              });
                                            } catch (e) {
                                              setState(() {
                                                _isSigninIn = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(e.toString()),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          child: _isSigninIn
                                              ? CircularProgressIndicator(
                                                  year2023: false,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                                )
                                              : Text(
                                                  'Sign In',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                        ))),
                                const SizedBox(height: 5),
                                Center(child: Text("or")),
                                const SizedBox(height: 5),
                                ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: SizedBox(
                                        width: 329,
                                        height: 50,
                                        child: OutlinedButton(
                                            onPressed: () async {
                                              try {
                                                setState(() {
                                                  _isSigninInWithGoogle = true;
                                                });
                                                final userCredential =
                                                    await AuthService
                                                        .signInWithGoogle();
                                                setState(() {
                                                  _isSigninInWithGoogle = false;
                                                });
                                                if (kDebugMode) {
                                                  print(
                                                      'Signed in: ${userCredential.user?.displayName}');
                                                }
                                              } catch (e) {
                                                if (kDebugMode) {
                                                  print(
                                                      'Google Sign-In Error: $e');
                                                }
                                              }
                                            },
                                            style: OutlinedButton.styleFrom(),
                                            child: _isSigninInWithGoogle
                                                ? CircularProgressIndicator(
                                                    year2023: false,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                        Text(
                                                            'Sign in with Google   |   ',
                                                            style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSurface,
                                                                fontSize: 15)),
                                                        Image.asset(
                                                            "assets/images/logo/google_logo.webp",
                                                            height: 23)
                                                      ])))),
                                const SizedBox(height: 15),
                                Row(children: [
                                  const Text("Don't have an account? ",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(width: 2.5),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterPage()));
                                      },
                                      child: Text('Sign Up',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900)))
                                ]),
                                const SizedBox(height: 5),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPassPage()));
                                    },
                                    child: Text('Forget Password?',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w900))),
                                const SizedBox(height: 10)
                              ]))
                    ]))));
  }
}
