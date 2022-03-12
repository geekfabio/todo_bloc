import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/cubit/theme_cubit.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/home/home_page.dart';

import 'features/todo_pomodoro/shared/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            //    themeMode: context.select((ThemeCubit cubit) => cubit.state.mode),
            themeMode: ThemeMode.dark,
            darkTheme: AppTheme.lightTheme,
            title: 'Todo Bloc',
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
