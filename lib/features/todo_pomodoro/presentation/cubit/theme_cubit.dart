import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(mode: ThemeMode.system));

  //TODO save current theme in Storage
  //TODO add a combobox on application settings to select current theme
  void changeCurrentTheme() {
    if (state.mode == ThemeMode.dark) {
      emit(const ThemeState(mode: ThemeMode.light));
    } else {
      emit(const ThemeState(mode: ThemeMode.dark));
    }
  }
}
