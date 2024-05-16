import 'package:belajaraksara/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'general_widgets.dart';

class WidgetBgApp extends StatelessWidget {
  final List<Widget> children;
  const WidgetBgApp({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralWidgets.appBarCustomTransparent(),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/bg_batik.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
