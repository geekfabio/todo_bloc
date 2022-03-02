import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';

class TodosListModel extends Equatable {
  final List<TodoModel> list;

  const TodosListModel({
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return {
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory TodosListModel.fromMap(Map<String, dynamic> map) {
    return TodosListModel(
      list: List<TodoModel>.from(map['list']?.map((x) => TodoModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodosListModel.fromJson(String source) =>
      TodosListModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [list];
}
