import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/todo_bloc/cubit/theme_cubit.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/home/home_page.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/signup/signup_page.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/theme.dart';

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
            themeMode: ThemeMode.light,
            darkTheme: AppTheme.darkTheme,
            title: 'Autocompletar form com NIF/ID',
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
