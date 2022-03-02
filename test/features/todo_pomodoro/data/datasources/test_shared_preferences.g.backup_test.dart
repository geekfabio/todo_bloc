import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';

import '../../../../json/json_file_reader.dart';

class TestShared {
  final String _key = "shared";
  final SharedPreferences sharedPreferences;
  TestShared({
    required this.sharedPreferences,
  });

  Future<bool> saveTodo(TodoModel todoModel) async {
    final bool result =
        await sharedPreferences.setString("TOKEN", todoModel.toJson());
    return Future.value(result);
  }

  Future<bool> deleteTodo(TodoModel todoModel) async {
    final result = sharedPreferences.remove(_key);
    return Future.value(result);
  }
}

void main() {
  late TestShared shared;

  SharedPreferences? preference;

  setUp(() async {
    preference = await SharedPreferences.getInstance();
    shared = TestShared(sharedPreferences: preference!);
    SharedPreferences.setMockInitialValues({});
  });

  final jsonString =
      jsonDecode(jsonFileReader("todo_list.json")).cast<Map<String, dynamic>>();

  final list =
      jsonString.map((e) => TodoModel.fromMap(e)).toList().cast<TodoModel>();
  const tTdodoItem = TodoModel(
    id: '1',
    title: 'title',
    dateCreated: 'description',
    isDone: false,
  );

  test(
    "when save todo",
    () async {
      shared.saveTodo(tTdodoItem);
      final result = preference!.getString("TOKEN");
      expect(result, tTdodoItem.toJson());
    },
  );
  test(
    "when delete todo",
    () {
      final result = shared.deleteTodo(tTdodoItem);
      expect(result, true);
    },
  );
}
