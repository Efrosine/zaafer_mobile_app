import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/dialog_widget/warning_dialog.dart';

import 'config/custom_theme/app_theme.dart';
import "firebase_options.dart";

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CobaUI());
}

class CobaUI extends StatelessWidget {
  const CobaUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: CAppTheme.lighTheme,
        darkTheme: CAppTheme.darkTheme,
        builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            ),
        home: tes());
  }
}

class tes extends StatelessWidget {
  const tes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => showDialog(
                  context: context,
                  builder: (context) => WarningDialog(message: 'message'),
                ),
            child: Text('Click Me')),
      ),
    );
  }
}
