import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/wifi_setup/presentation/pages/wifi_networks_page.dart';
import '../../features/wifi_setup/presentation/pages/wifi_networks_list_page.dart';
import '../../features/wifi_setup/presentation/pages/wifi_setup_page.dart';
import '../../features/wifi_setup/presentation/pages/wifi_connected_page.dart';

class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'splash',
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/signup',
          name: 'signup',
          builder: (context, state) => const SignupPage(),
        ),
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          builder: (context, state) => const DashboardPage(),
        ),

        GoRoute(
          path: '/wifi-networks',
          name: 'wifi-networks',
          builder: (context, state) => const WifiNetworksPage(),
        ),
        GoRoute(
          path: '/wifi-networks-list',
          name: 'wifi-networks-list',
          builder: (context, state) => const WifiNetworksListPage(),
        ),
        GoRoute(
          path: '/wifi-setup',
          name: 'wifi-setup',
          builder: (context, state) {
            final networkName = state.uri.queryParameters['network'];
            return WifiSetupPage(selectedNetworkName: networkName);
          },
        ),
        GoRoute(
          path: '/wifi-connected',
          name: 'wifi-connected',
          builder: (context, state) => const WifiConnectedPage(),
        ),
      ],
    );
  }
}
