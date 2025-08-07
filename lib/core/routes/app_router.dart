import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../logging/logger.dart';
import '../di/injection_container.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/wifi_setup/presentation/pages/wifi_networks_page.dart';
import '../../features/wifi_setup/presentation/pages/wifi_setup_page.dart';
import '../../features/wifi_setup/presentation/pages/wifi_connected_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: _AuthChangeNotifier(sl<AuthBloc>()),
      redirect: (context, state) {
        final authBloc = sl<AuthBloc>();
        final authState = authBloc.state;
        final currentLocation = state.matchedLocation;

        Logger.navigation(
          'Router redirect - State: ${authState.runtimeType}, Location: $currentLocation',
        );

        // Simple logic:
        // - If authenticated → dashboard (unless already there)
        // - If unauthenticated → login (unless on auth pages)
        // - If initial/loading → splash (to let Firebase check)

        if (authState is Authenticated) {
          if (currentLocation == '/' ||
              currentLocation == '/login' ||
              currentLocation == '/signup') {
            Logger.navigation('Authenticated user → redirecting to dashboard');
            return '/dashboard';
          }
        } else if (authState is Unauthenticated) {
          if (currentLocation == '/' || currentLocation == '/dashboard') {
            Logger.navigation('Unauthenticated user → redirecting to login');
            return '/login';
          }
        }
        // For AuthInitial or AuthLoading, let user stay where they are

        return null;
      },
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
          path: '/wifi-setup',
          name: 'wifi-setup',
          builder: (context, state) => const WifiSetupPage(),
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

class _AuthChangeNotifier extends ChangeNotifier {
  final AuthBloc _authBloc;
  late StreamSubscription<AuthState> _subscription;

  _AuthChangeNotifier(this._authBloc) {
    _subscription = _authBloc.stream.listen((state) {
      // Only notify on meaningful state changes
      if (state is Authenticated ||
          state is Unauthenticated ||
          state is AuthError) {
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
