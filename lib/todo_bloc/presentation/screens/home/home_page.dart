import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/home/components/list_of_todos.dart';
import 'package:todo_bloc/todo_bloc/shared/utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        desktop: ListOfTodos(),
        tablet: ListOfTodos(),
        mobile: ListOfTodos(),
      ),
    );
  }
}
