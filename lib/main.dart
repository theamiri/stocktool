import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/logging/logger.dart';
import 'core/di/injection_container.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    Logger.firebase('Firebase initialized successfully in main');
  } catch (e) {
    Logger.firebaseError('Firebase initialization error in main', error: e);
  }

  // Initialize dependency injection
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>.value(value: di.sl<AuthBloc>())],
      child: MaterialApp.router(
        title: 'Stock Tools',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryGold),
          useMaterial3: true,
          scaffoldBackgroundColor: AppTheme.backgroundColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: AppTheme.primaryButtonStyle,
          ),
        ),
        routerConfig: AppRouter.createRouter(),
      ),
    );
  }
}
