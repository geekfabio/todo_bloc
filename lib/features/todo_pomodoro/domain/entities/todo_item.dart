import 'package:equatable/equatable.dart';

class TodoItem extends Equatable {
  final String id;
  final String title;
  final String dateCreated;
  final String dateFinish;
  final String dateToStart;
  final String? project;
//   final Color? color;
  final bool isDone;

  const TodoItem({
    required this.id,
    required this.title,
    required this.dateCreated,
    required this.isDone,
    this.dateFinish = "Today",
    this.dateToStart = "Today",
    this.project = "Task",
    //   this.color = Colors.blue,
  });
  @override
  List<Object> get props {
    return [
      id,
      title,
      dateCreated,
      dateFinish,
      dateToStart,
      project!,
      // Color!,
      isDone,
    ];
  }
}
