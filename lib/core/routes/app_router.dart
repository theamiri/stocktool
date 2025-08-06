import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
    ],
  );
}
