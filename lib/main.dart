import 'package:flutter/material.dart';
import 'config/theme/app_theme.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    final AppTheme appBarTheme = AppTheme();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.router.routeInformationProvider,
      routeInformationParser: router.router.routeInformationParser,
      routerDelegate: router.router.routerDelegate,
      title: 'Paseamos?',
      theme: appBarTheme.getTheme(),
    );
  }
}
