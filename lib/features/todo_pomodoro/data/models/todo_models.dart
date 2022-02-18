import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';

//TODO implement Color when study this from Json
class TodoModel extends TodoItem {
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
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"],
      title: json["title"],
      dateCreated: json["dateCreated"] ?? '',
      isDone: json["isDone"] ?? false,
      dateFinish: json["dateFinish"] ?? '',
      dateToStart: json["dateToStart"] ?? '',
      project: json["project"] ?? '',
      //   color: json["color"] ?? Colors.blue,
    );
  }
}
