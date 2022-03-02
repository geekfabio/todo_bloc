import 'package:flutter/material.dart';

import 'dark_color.dart';
import 'light_color.dart';

class AppTheme {
  const AppTheme();

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
    brightness: Brightness.dark,
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

class AppTransitionTimes {
  static const veryFast = Duration(milliseconds: 70);
  static const fast = Duration(milliseconds: 150);
  static const medium = Duration(milliseconds: 300);
  static const slow = Duration(milliseconds: 600);
  // static const verySlow = Duration(seconds: 10);
}

class AppIconSizes {
  static const double xl = 48;
  static const double lg = 32;
  static const double md = 24;
  static const double sm = 16;
}

class Insets {
  // Regular paddings
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;
  static const double xl = 32;

  static const double offset = 40;
}

class AppBorders {
  static const double sm = 4;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double md = 6;
  static const Radius mdRadius = Radius.circular(md);
  static const BorderRadius mdBorder = BorderRadius.all(mdRadius);

  static const double lg = 12;
  static const Radius lgRadius = Radius.circular(lg);
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
}

class Strokes {
  static const double thin = 1;
  static const double light = 2;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 10),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.05),
            spreadRadius: 0.1,
            blurRadius: 0.2,
            offset: const Offset(0, 1)),
      ];
}
