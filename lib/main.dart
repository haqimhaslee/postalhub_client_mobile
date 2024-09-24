import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';
import 'firebase_options.dart';
import 'package:postalhub_tracker/src/postalhub_ui.dart';
import 'package:dynamic_color/dynamic_color.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return MaterialApp(
          theme: ThemeData(
            colorScheme: lightDynamic ?? lightColorScheme,
            fontFamily: 'GoogleSans',
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic ?? darkColorScheme,
            fontFamily: 'GoogleSans',
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: const NavigatorServices());
    });
  }
}
