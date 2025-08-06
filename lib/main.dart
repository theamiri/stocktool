import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Stock Tools',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE6A72C)),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
