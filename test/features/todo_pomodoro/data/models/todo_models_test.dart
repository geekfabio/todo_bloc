import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';

import '../../../../json/json_file_reader.dart';

void main() {
  const model = TodoModel(
      id: "1",
      title: "title",
      dateCreated: "1",
      dateFinish: "1",
      dateToStart: "1",
      project: "Task",
      isDone: false);
  test("Should be a subclass of TodoItem entity", () {
    expect(model, isA<TodoEntity>());
  });

  group("Map serialize", () {
    test(
      "Deve converter de Map para uma TodoModel",
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(jsonFileReader("todo_item.json"));
        //act
        final result = TodoModel.fromMap(jsonMap);
        //assert
        expect(model, equals(result));
      },
    );

    test(
      "Deve converter de TodoModel para um Map",
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(jsonFileReader("todo_item.json"));
        //act
        final result = model.toMap();
        //assert
        expect(jsonMap, result);
      },
    );
  });

  group("Json serialize", () {
    test(
      "Deve converter de json para uma TodoModel",
      () async {
        //arrange
        final String jsonString = jsonFileReader("todo_item.json");
        //act
        final result = TodoModel.fromJson(jsonString);
        //assert
        expect(model, equals(result));
      },
    );

    test(
      "Deve converter uma TodoModel para Json",
      () {
        final result = model.toJson();
        expect(model.toJson(), equals(result));
      },
    );
  });
}
