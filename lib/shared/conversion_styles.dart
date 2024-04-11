import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSize {
  static double small = 6.0;
  static double xSmall = 10.0;
  static double medium = 14.0;
  static double xMedium = 18.0;
  static double large = 22.0;
  static double xLarge = 26.0;
  static double big = 30.0;
  static double xBig = 34.0;
  static double profileSize = 55.0;
}

class ConversionStyles {
  TextStyle appBarTitle({Color? textColor, double? size}) {
    return GoogleFonts.lato(
        fontSize: size ?? TextSize.medium,
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700);
  }

  TextStyle paragraph(
    double size, {
    FontWeight? weight,
    Color? color,
    bool isLink = false,
  }) {
    return GoogleFonts.lato(
        decoration: isLink ? TextDecoration.underline : TextDecoration.none,
        fontSize: size,
        color: isLink ? Colors.blue : color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal);
  }
}
