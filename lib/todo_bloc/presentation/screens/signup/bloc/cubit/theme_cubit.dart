import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(ThemeData initialState) : super(ThemeMode.light);
  var currentTheme = ThemeMode.light;

  void toggleTheme() {
    emit(state == ThemeMode.light ? state : ThemeMode.dark);
  }
}
