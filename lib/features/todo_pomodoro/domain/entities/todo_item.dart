import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoItem extends Equatable {
  String id;
  String title;
  String dateCreated;
  String dateFinish;
  String dateToStart;
  String? project;
  Color? color;
  bool isDone;

  TodoItem({
    required this.id,
    required this.title,
    required this.dateCreated,
    required this.isDone,
    this.dateFinish = "Today",
    this.dateToStart = "Today",
    this.project = "",
    this.color = Colors.blue,
  });
  @override
  List<Object> get props {
    return [
      title,
      dateCreated,
      dateFinish,
      dateToStart,
      project!,
      color!,
      isDone,
    ];
  }
}
