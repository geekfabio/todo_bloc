import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/signup/signup_page.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
