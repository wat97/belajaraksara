import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeProvider with ChangeNotifier {
  setUp(BuildContext context) async {}

  goToLesson(BuildContext context) {
    print("goToLesson data");
    context.go(
      "/lesson",
    );
  }

  goToLatihan(BuildContext context) {
    print("goToLesson data");
    context.push(
      "/latihan",
    );
  }
}
