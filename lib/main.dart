//INTERNAL PACKAGE
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/auth_services/auth_snapshot.dart';
import 'package:postalhub_tracker/src/components/theme_manager.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';
import 'package:postalhub_tracker/src/postalhub_ui.dart';
import 'package:flutter/services.dart';

//EXTERNAL PACKAGE
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dynamic_color/dynamic_color.dart';

final themeManager = ThemeManager();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('key'),
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.deviceCheck,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(MyApp(themeManager));
}

class MyApp extends StatelessWidget {
  final ThemeManager themeManager;
  const MyApp(this.themeManager, {super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? dynamicLight, ColorScheme? dynamicDark) {
        final ColorScheme lightScheme = dynamicLight ?? lightColorScheme;
        final ColorScheme darkScheme = dynamicDark ?? darkColorScheme;

        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeManager,
          builder: (context, themeMode, _) {
            return MaterialApp(
              title: "Postal Hub",
              theme: ThemeData(
                colorScheme: lightScheme,
                useMaterial3: true,
                inputDecorationTheme: const InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                textTheme: GoogleFonts.nunitoTextTheme(),
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android:
                        PredictiveBackPageTransitionsBuilder(),
                  },
                ),
              ),
              darkTheme: ThemeData(
                colorScheme: darkScheme,
                useMaterial3: true,
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: darkScheme.primary,
                    ),
                  ),
                ),
                textTheme: GoogleFonts.nunitoTextTheme().apply(
                  bodyColor: darkScheme.onSurface,
                  displayColor: darkScheme.onSurface,
                ),
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android:
                        PredictiveBackPageTransitionsBuilder(),
                  },
                ),
              ),
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              home: kIsWeb
                  ? NavigatorServices()
                  : const AuthSnapshot(), //applicable for debug
              //home: NavigatorServices(), //for full production auth for all platforms
            );
          },
        );
      },
    );
  }
}
