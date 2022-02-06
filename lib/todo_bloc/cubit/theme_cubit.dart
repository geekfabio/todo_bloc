import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(ThemeMode.system));

  void togleChange(ThemeMode model) {
    emit(ThemeInitial(model));
  }
}
