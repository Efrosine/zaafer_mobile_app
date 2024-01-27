import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zaafer_mobile_app/config/custom_theme/app_theme.dart';
import 'package:zaafer_mobile_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: CAppTheme.lighTheme,
      darkTheme: CAppTheme.darkTheme,
      home: const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('hello word'),
          ),
        ),
      ),
    );
  }
}
