import 'package:flutter/material.dart';
import 'package:todo_bloc/signup/core/repository/signup_repository.dart';
import 'package:todo_bloc/signup/presentation/screens/signup/signup_page.dart';
import 'package:todo_bloc/signup/shared/themes/theme.dart';

class MyApp extends StatelessWidget {
  final SignupRepository repository;
  const MyApp({Key? key, required this.repository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: 'Autocompletar form com NIF/ID',
      home: const SignupPage(),
    );
  }
}
