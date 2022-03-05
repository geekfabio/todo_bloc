import 'dart:convert';

import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel(
      {required String id,
      required String title,
      required String dateCreated,
      required bool isDone,
      String dateFinish = "",
      String dateToStart = "",
      String project = "Task"
      // Color color = Colors.blue,
      })
      : super(
          id: id,
          title: title,
          dateCreated: dateCreated,
          isDone: isDone,
          dateFinish: dateFinish,
          dateToStart: dateToStart,
          project: project,
          //    color: color,
        );

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      dateCreated: map['dateCreated'] ?? '',
      dateFinish: map['dateFinish'] ?? '',
      dateToStart: map['dateToStart'] ?? '',
      project: map['project'],
      isDone: map['isDone'] ?? false,
    );
  }

  /// cast [TodoEntity] to [TodoModel]
  factory TodoModel.fromTodoEntity(TodoEntity todoEntity) {
    return TodoModel(
      id: todoEntity.id,
      title: todoEntity.title,
      dateCreated: todoEntity.dateCreated,
      dateFinish: todoEntity.dateFinish,
      dateToStart: todoEntity.dateToStart,
      project: todoEntity.project,
      isDone: todoEntity.isDone,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateCreated': dateCreated,
      'dateFinish': dateFinish,
      'dateToStart': dateToStart,
      'project': project,
      'isDone': isDone,
    };
  }
}
