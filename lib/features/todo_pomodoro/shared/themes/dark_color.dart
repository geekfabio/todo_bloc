import 'package:flutter/material.dart';

//TODO implements cdark colors
class DarkColor {
  static const Color primaryColor = Color(0xFF1758C1);
  static const Color splashBackground = Color(0xff20262C);
  static const Color background = Color(0xff252525);

  //text colors
  static const Color titleTextColor = Color(0XFFFFFFFF);
  static const Color subTitleTextColor = Color(0xFFF9F9F9);
  static const Color bodyTextCaption = Color(0xFFF9F9F9);

  //Input Theme
  static const Color borderColor = Color(0xff747F8F);
  static const Color focusedBorderColor = lightBlue;
  static const Color focusColor = primaryColor;
  static const Color inputFillColor = Color(0xff20262C);
  static const Color inputTextColor = Color(0xff747F8F);
  static const Color inputHoverColor = Color(0xff252525);
  static const LinearGradient colorGradientGrey = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFFE7F0FB),
      Color(0xFFFFFFFF),
    ],
  );

  static const Color lightBlue = Color(0xff2355A4);
  static const Color gold = Color(0xFFEAB65D);
  static const Color red = Color(0xffF72804);
  static const Color lightGrey = Color(0xffE1E2E4);
  static const Color grey = Color(0xffA1A3A6);
  static const Color darkgrey = Color(0xff747F8F);
  static const Color iconColor = Color(0xFFE7F0FB);
  static const Color yellowColor = Color(0xfffbba01);
  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);
}
