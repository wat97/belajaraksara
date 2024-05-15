import 'package:belajaraksara/app.dart';
import 'package:belajaraksara/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: MyApp(),
    ),
  );
}
