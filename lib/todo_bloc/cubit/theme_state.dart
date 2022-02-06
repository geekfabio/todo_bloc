part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  ThemeState(mode) : mode = ThemeMode.system;
  ThemeMode mode;

  @override
  List<Object> get props => [mode];
}

class ThemeInitial extends ThemeState {
  ThemeInitial(mode) : super(mode);
}
