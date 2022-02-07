import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/theme.dart';

///Use this for screen responsive, Mobile, Tablet, Desktop

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);

  //TODO choose if this code continue here or move in theme or style app
  static bool isMobile(BuildContext context) =>
      AppTheme.screenWidth(context) < 650;
  static bool isTablet(BuildContext context) =>
      AppTheme.screenWidth(context) >= 650 &&
      AppTheme.screenWidth(context) < 1100;
  static bool isDesktop(BuildContext context) =>
      AppTheme.screenWidth(context) >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
