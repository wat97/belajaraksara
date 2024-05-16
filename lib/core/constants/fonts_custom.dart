import 'package:belajaraksara/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts {
  static TextStyle bitTextBold = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17);

  static TextStyle toolbarFonts = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);

  static TextStyle largeText = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17);

  static TextStyle largeTextGrey = GoogleFonts.quicksand()
      .copyWith(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 17);

  static TextStyle largeTextBold = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17);

  static TextStyle largeTextBold2 = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 18);

  static TextStyle largeTextBoldGrey = GoogleFonts.quicksand()
      .copyWith(color: Colors.grey, fontWeight: FontWeight.w900, fontSize: 18);

  static TextStyle largeTextBold3 = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 17);

  static TextStyle largeTextBoldPrimary = GoogleFonts.quicksand().copyWith(
      color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 20);

  static TextStyle mediumTextGrey = GoogleFonts.quicksand()
      .copyWith(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15);

  static TextStyle mediumText = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15);

  static TextStyle mediumTextBold = GoogleFonts.quicksand()
      .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15);

  static TextStyle mediumTextBoldGrey = GoogleFonts.quicksand()
      .copyWith(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15);
}
