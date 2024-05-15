import 'package:belajaraksara/providers/home_provider.dart';
import 'package:belajaraksara/screens/home_screen.dart';
import 'package:belajaraksara/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  GoRouter get router => GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              builder: (context, child) => const HomeScreen(),
            ),
            // const HomeScreen(),
          ),
        ],
      );
}
