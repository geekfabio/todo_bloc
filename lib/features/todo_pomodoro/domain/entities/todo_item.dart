import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoItem extends Equatable {
  String id;
  String title;
  String dateCreated;
  String dateFinish;
  String dateToStart;
  TagModel? tag;
  String? project;
  Color? color;
  bool isChecked;
  List<TaskModel>? steps;
  TodoPriority priority;

  TodoItem({
    required this.id,
    required this.title,
    required this.dateCreated,
    required this.isChecked,
    this.dateFinish = "Today",
    this.dateToStart = "Today",
    this.tag,
    this.project = "",
    this.color = Colors.blue,
    this.steps,
    this.priority = TodoPriority.low,
  });
  @override
  List<Object> get props {
    return [
      title,
      dateCreated,
      dateFinish,
      dateToStart,
      tag!,
      project!,
      color!,
      isChecked,
      steps!,
    ];
  }
}

enum TodoPriority { high, medium, low }

class TaskModel {
  String? title;
  bool? isPomodoro;
  TaskModel({
    required this.title,
    this.isPomodoro = false,
  });
}

class TagModel {
  String title;
  Color color;
  TagModel({
    required this.title,
    this.color = Colors.blue,
  });

  factory TagModel.empty() {
    return TagModel(title: "none");
  }
}
