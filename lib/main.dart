import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';
import 'firebase_options.dart';
import 'package:postalhub_tracker/src/postalhub_ui.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor:
        Colors.transparent, // transparent on Android, translucent on iOS
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark, // Or Brightness.light
  ));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return MaterialApp(
          title: "Postal Hub | Tracker",
          theme: ThemeData(
            colorScheme: lightDynamic ?? lightColorScheme,
            textTheme: GoogleFonts.openSansTextTheme(),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
              },
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic ?? darkColorScheme,
            textTheme: GoogleFonts.openSansTextTheme().apply(
              bodyColor: darkColorScheme.onSurface,
              displayColor: darkColorScheme.onSurface,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
              },
            ),
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: const NavigatorServices());
    });
  }
}
