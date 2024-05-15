import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes/app_router.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = AppRouter().router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
