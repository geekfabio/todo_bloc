import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';

import 'dark_color.dart';
import 'light_color.dart';

class AppTheme {
  const AppTheme();

  //TODO add text theme on LightTheme and DarkTheme

  static ThemeData lightTheme = ThemeData(
    splashColor: LightColor.splashBackground,
    backgroundColor: LightColor.background,
    primaryColor: LightColor.primaryColor,
    cardTheme: const CardTheme(color: LightColor.background),
    textTheme: const TextTheme(bodyText1: TextStyle(color: LightColor.black)),
    iconTheme: const IconThemeData(color: LightColor.iconColor),
    bottomAppBarColor: LightColor.background,
    dividerColor: LightColor.lightGrey,
    primaryTextTheme: TextTheme(
        button: buttonStyle,
        subtitle1: titleStyle,
        subtitle2: subTitleStyle,
        bodyText1: const TextStyle(color: LightColor.bodyTextCaption)),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: LightColor.focusColor,
      fillColor: LightColor.inputFillColor,
      hoverColor: LightColor.inputHoverColor,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.red, width: 2.0),
        borderRadius: AppBorders.lgBorder,
      ),
      iconColor: LightColor.lightBlue,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.borderColor, width: 0.5),
        borderRadius: AppBorders.mdBorder,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.red, width: 1.0),
        borderRadius: AppBorders.mdBorder,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: LightColor.focusedBorderColor, width: 1.0),
        borderRadius: AppBorders.mdBorder,
      ),
    ),
  );

  //TODO implemts dark theme
  static ThemeData darkTheme = ThemeData(
    splashColor: DarkColor.splashBackground,
    backgroundColor: DarkColor.background,
    primaryColor: DarkColor.primaryColor,
    cardTheme: const CardTheme(color: DarkColor.background),
    textTheme: const TextTheme(bodyText1: TextStyle(color: DarkColor.black)),
    iconTheme: const IconThemeData(color: DarkColor.iconColor),
    primaryIconTheme: const IconThemeData(color: DarkColor.iconColor),
    bottomAppBarColor: DarkColor.background,
    dividerColor: DarkColor.lightGrey,
    primaryTextTheme: TextTheme(
        button: buttonStyle,
        subtitle1: titleStyle.copyWith(color: DarkColor.subTitleTextColor),
        subtitle2: subTitleStyle.copyWith(color: DarkColor.subTitleTextColor),
        bodyText1: const TextStyle(color: DarkColor.bodyTextCaption)),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: DarkColor.focusColor,
      fillColor: DarkColor.inputFillColor,
      hoverColor: DarkColor.inputHoverColor,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: DarkColor.red, width: 2.0),
        borderRadius: AppBorders.lgBorder,
      ),
      iconColor: DarkColor.lightBlue,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: DarkColor.lightblack, width: 1.2),
        borderRadius: AppBorders.mdBorder,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: DarkColor.red, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: DarkColor.focusedBorderColor, width: 1.5),
        borderRadius: AppBorders.mdBorder,
      ),
    ),
  );

  static TextStyle inputStyle = const TextStyle(fontSize: 16);
  static TextStyle buttonStyle =
      const TextStyle(color: LightColor.background, fontSize: 16);
  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 20);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 17);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}