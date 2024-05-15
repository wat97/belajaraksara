import 'package:belajaraksara/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String buttonText;
  final Function onpressed;
  final bool isDisable;
  final bool colorOrange;
  final Color? colorButton;

  const ButtonPrimary({
    super.key,
    required this.buttonText,
    required this.onpressed,
    this.isDisable = false,
    this.colorOrange = false,
    this.colorButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 1.0],
          colors: [
            isDisable
                ? AppColors.bgGrey
                : colorButton == null
                    ? AppColors.primaryColor
                    : colorButton!,
            isDisable
                ? AppColors.bgGrey
                : colorButton == null
                    ? AppColors.primaryColor
                    : colorButton!,
          ],
        ),
        // color: colorButton == null ? MyColors.colorPrimaryDark : colorButton,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          if (!isDisable) {
            onpressed();
          }
        },
        child: Text(
          buttonText,
          // style: MyFonts.normalTextBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
