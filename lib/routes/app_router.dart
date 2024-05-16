import 'package:belajaraksara/models/model_aksara.dart';
import 'package:belajaraksara/providers/detail_provider.dart';
import 'package:belajaraksara/providers/home_provider.dart';
import 'package:belajaraksara/providers/latihan_provider.dart';
import 'package:belajaraksara/providers/lesson_provider.dart';
import 'package:belajaraksara/screens/detail_screen.dart';
import 'package:belajaraksara/screens/home_screen.dart';
import 'package:belajaraksara/screens/latihan_screen.dart';
import 'package:belajaraksara/screens/lesson_screen.dart';
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
          GoRoute(
            path: '/lesson',
            builder: (context, state) => ChangeNotifierProvider(
              create: (context) => LessonProvider(),
              builder: (context, child) => const LessonScreen(),
            ),
            // const LessonScreen(),
          ),
          GoRoute(
            path: '/detail',
            builder: (context, state) => ChangeNotifierProvider(
              create: (context) => DetailProvider(state.extra as ModelAksara),
              builder: (context, child) => const DetailScreen(),
            ),
            // const LessonScreen(),
          ),
          GoRoute(
            path: '/latihan',
            builder: (context, state) => ChangeNotifierProvider(
              create: (context) => LatihanProvider(),
              builder: (context, child) => const LatihanScreen(),
            ),
            // const LessonScreen(),
          ),
        ],
      );
}
