import 'package:flutter/material.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/components/menu/menu.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/utils/responsive.dart';

import 'components/list_of_todos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        desktop: Row(
          children: [
            Expanded(
                flex: AppTheme.screenWidth(context) > 1345 ? 2 : 1,
                child: const Menu()),
            Expanded(
                flex: AppTheme.screenWidth(context) > 1345 ? 7 : 4,
                child: const ListOfTodos()),
          ],
        ),
        tablet: const ListOfTodos(),
        mobile: const ListOfTodos(),
      ),
    );
  }
}
