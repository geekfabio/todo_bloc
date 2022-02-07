part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.mode});
  final ThemeMode mode;

  @override
  List<Object> get props => [mode];
}
