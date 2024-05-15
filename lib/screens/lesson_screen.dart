import 'package:belajaraksara/providers/lesson_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<LessonProvider>(context, listen: false).setUp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
