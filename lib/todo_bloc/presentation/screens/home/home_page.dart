import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/presentation/components/menu/menu.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/home/components/list_of_todos.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/theme.dart';
import 'package:todo_bloc/todo_bloc/shared/utils/responsive.dart';

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
