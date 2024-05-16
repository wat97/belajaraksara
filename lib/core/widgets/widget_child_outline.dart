import 'package:flutter/material.dart';

class WidgetChildOutline extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Color bgColor;

  const WidgetChildOutline({
    super.key,
    required this.path,
    this.height,
    this.width,
    Color? bgColor,
  }) : bgColor = bgColor ?? Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(
        child: Image.asset(
          path,
          width: 30,
        ),
      ),
    );
  }
}
