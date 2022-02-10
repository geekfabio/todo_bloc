import 'package:flutter/material.dart';

enum TodoPriority {
  high,
  medium,
  low,
}

class TodoModel {
  String title;
  String dateCreated;
  String dateFinish;
  String dateToStart;
  TagModel? tag;
  String? path;
  Color? color;
  bool isChecked;
  List<TaskModel>? subtasks;
  TodoPriority priority;
  TodoModel({
    required this.title,
    required this.dateCreated,
    required this.isChecked,
    this.dateFinish = "Today",
    this.dateToStart = "Today",
    this.tag,
    this.path = "",
    this.color = Colors.blue,
    this.subtasks,
    this.priority = TodoPriority.low,
  });
}

class TaskModel {
  String? title;
  TaskModel({
    required this.title,
  });
}

class TagModel {
  String title;
  Color color;
  TagModel({
    required this.title,
    this.color = Colors.blue,
  });
}

List<TodoModel> todos = List.generate(
  demo_data.length,
  (index) => TodoModel(
    title: demo_data[index]['name'],
    tag: demo_data[index]['image'],
    dateToStart: demo_data[index]['subject'],
    path: demo_data[index]['subject'],
    isChecked: demo_data[index]['isChecked'],
    color: demo_data[index]['tagColor'],
    dateFinish: demo_data[index]['time'],
    dateCreated: "Today",
  ),
);

//add more itens to test responsivity
List demo_data = [
  {
    "name": "Apple",
    "image": TagModel(title: "Software", color: Colors.purple),
    "subject": "iPhone 12 is here",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": "Now"
  },
  {
    "name": "Elvia Atkins",
    "image": TagModel(title: "Project", color: Colors.red),
    "subject": "Inspiration for our new home",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "15:32"
  },
  {
    "name": "Marvin Kiehn",
    "image": TagModel(title: "Project", color: Colors.red),
    "subject": "Business-focused empowering the world",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "14:27",
  },
  {
    "name": "Domenic Bosco",
    "image": TagModel(title: "Green", color: Colors.green),
    "subject": "The fastest way to Design",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": "10:43"
  },
  {
    "name": "Elenor Bauch",
    "image": null,
    "subject": "New job opportunities",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color(0xFF3A6FF7),
    "time": "9:58"
  }
];
