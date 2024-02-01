import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/auth_pages.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const SignInPage());
      case '/signin':
        return _materialRoute(const SignInPage());
      case '/signup':
        return _materialRoute(const SignUpPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404'),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget pages) {
    return MaterialPageRoute(builder: (_) => SafeArea(child: pages));
  }
}
