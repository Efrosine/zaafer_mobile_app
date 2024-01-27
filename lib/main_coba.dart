import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zaafer_mobile_app/config/custom_theme/app_theme.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/pages/profile_page.dart';

import 'features/shop/presentation/pages/detail_transaction_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Coba());
}

class Coba extends StatelessWidget {
  const Coba({super.key});

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
      home: const SafeArea(child: ProfilePage()),
    );
  }
}
