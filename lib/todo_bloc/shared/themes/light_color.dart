import 'package:flutter/material.dart';

class LightColor {
  ///Theme light
  static const Color primaryColor = Color(0xFF1758C1);
  static const Color splashBackground = Color(0XFFFFFFFF);
  static const Color background = Color(0xFFF0F0F0);

  //text colors
  static const Color titleTextColor = Color(0xFF2D333A);
  static const Color subTitleTextColor = Color(0xFF505255);
  static const Color bodyTextCaption = Color(0xff20262C);

  //card Colors

  //Input Theme
  static const Color borderColor = Color(0xFFF9F9F9);
  static const Color focusedBorderColor = lightBlue;
  static const Color focusColor = splashBackground;
  static const Color inputFillColor = splashBackground;
  static const Color inputHoverColor = Color(0xFFF2F6FC);
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
  static const Color iconColor = Color(0xff20262C);
  static const Color yellowColor = Color(0xfffbba01);
  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);
}
