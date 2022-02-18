import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';

class TodoModel extends TodoItem {
  const TodoModel({
    required String id,
    required String title,
    required String dateCreated,
    required bool isDone,
    String dateFinish = "",
    String dateToStart = "",
    String project = "Task",
    Color color = Colors.blue,
  }) : super(
          id: id,
          title: title,
          dateCreated: dateCreated,
          isDone: isDone,
          dateFinish: dateFinish,
          dateToStart: dateToStart,
          project: project,
          color: color,
        );
}
