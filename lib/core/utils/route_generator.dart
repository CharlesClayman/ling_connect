import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/onboarding/presentation/pages/language_onboarding_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LanguageOnboardingPage());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeDashboardPage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      );
    });
  }
}
