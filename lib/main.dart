import 'package:flutter/material.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/wifi_setup/presentation/pages/wifi_setup_page.dart';
import 'features/wifi_setup/presentation/pages/wifi_networks_page.dart';
import 'features/wifi_setup/presentation/pages/wifi_password_page.dart';
import 'features/wifi_setup/presentation/pages/wifi_connected_page.dart';
import 'core/theme/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Tools',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/wifi-setup': (context) => const WifiSetupPage(),
        '/wifi-networks': (context) => const WifiNetworksPage(),
        '/wifi-password': (context) => const WifiPasswordPage(),
        '/wifi-connected': (context) => const WifiConnectedPage(),
      },
    );
  }
}
