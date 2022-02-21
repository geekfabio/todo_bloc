import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_models.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';

import '../../../../json/json_file_reader.dart';

void main() {
  const model = TodoModel(
    id: "1",
    title: "title",
    dateCreated: "dateCreated",
    isDone: false,
  );
  test("Should be a subclass of TodoItem entity", () {
    expect(model, isA<TodoItem>());
  });

  group("fromJson serialize", () {
    test(
      "Should return a list TodoModel",
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(jsonFileReader("todo.json"));
        //act
        final result = TodoModel.fromJson(jsonMap);
        //assert
        expect(model, equals(model));
      },
    );
  });

  group("ToJson serialize", () {
    test(
      "",
      () async {},
    );
  });
}
