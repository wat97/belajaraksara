import 'package:flutter/material.dart';

class GeneralWidgets {
  static dynamic appBarCustomTransparent() => PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      );
}
