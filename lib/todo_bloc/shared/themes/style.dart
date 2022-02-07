//TODO escolher se esse codigo continua aqui ou mover para theme app

import 'package:flutter/material.dart';

/// Styles - design system da app.

/// Used for all animations in the  app

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
