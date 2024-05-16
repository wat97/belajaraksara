import 'package:belajaraksara/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WidgetTextInOutline extends StatelessWidget {
  final String textLabel;
  final TextStyle styleLabel;
  final double? height;
  final double? width;
  final String textValue;
  final TextStyle styleValue;
  final Color bgColor;
  const WidgetTextInOutline({
    super.key,
    required this.textLabel,
    required this.textValue,
    TextStyle? styleLabel,
    TextStyle? styleValue,
    this.height,
    this.width,
    Color? bgColor,
  })  : styleLabel = styleLabel ?? const TextStyle(),
        styleValue = styleValue ?? const TextStyle(),
        bgColor = bgColor ?? AppColors.bgGrey;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textLabel,
              style: styleLabel,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              textValue,
              style: styleValue,
            )
          ],
        ),
      ),
    );
  }
}
