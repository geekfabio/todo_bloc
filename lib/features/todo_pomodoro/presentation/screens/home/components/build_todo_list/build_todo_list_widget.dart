import 'package:flutter/material.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/bloc/todo_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/home/components/todo_card/todo_card.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';

class BuildTodoList extends StatelessWidget {
  const BuildTodoList({
    Key? key,
    required this.todoBloc,
  }) : super(key: key);

  final TodoBloc todoBloc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                height: Insets.xs,
              ),
          itemCount: todoBloc.listCount,
          itemBuilder: (context, index) => TodoCard(
                model: todoBloc.listTodo[index],
              )),
    );
  }
}
