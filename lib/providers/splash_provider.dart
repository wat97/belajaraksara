import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashProvider with ChangeNotifier {
  setUp(BuildContext context) async {
    await startTimer(context);
  }

  startTimer(BuildContext context) async {
    mainPage(context);
  }

  mainPage(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        debugPrint("splash ${DateTime.now()}");
        context.go(
          "/home",
        );
      },
    );
  }
}
