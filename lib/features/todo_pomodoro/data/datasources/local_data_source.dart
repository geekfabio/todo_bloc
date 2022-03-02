import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/core/error/exceptions.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/mapper/todo_mapper.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<bool> addTodo(TodoModel todo);
  Future<bool> addListTodo({required TodosListModel todoList});
  Future<TodoModel> updateTodo(TodoModel todo);

  Future<TodoModel> deleteTodo(TodoModel todo);

  Future<TodoModel> getTodoById(String id);

  Future<List<TodoModel>> getAllTodo();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final String _sharedKey = "todo_shared_key";
  final SharedPreferences sharedPreferences;

  //!  this is a mock class of ObejctBox for study only
  // final Box boxObject;

  TodoLocalDataSourceImpl({
    required this.sharedPreferences,
    // required this.boxObject,
  });

  @override
  Future<bool> addTodo(TodoModel todo) {
    return sharedPreferences.setString(todo.id, todo.toJson());
  }

  @override
  Future<bool> addListTodo({required TodosListModel todoList}) {
    return sharedPreferences.setString(_sharedKey, todoList.toJson());
  }

  @override
  Future<TodoModel> deleteTodo(TodoModel todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    final result = sharedPreferences.getString(_sharedKey);
    if (result != null) {
      final json = jsonDecode(result);
      final list = (json as List)
          .map((e) => TodoModel.fromJson(e))
          .toList()
          .cast<TodoModel>();
      return Future.value(list);
    } else {
      return Future.value(List.empty());
    }
  }

  @override
  Future<TodoModel> getTodoById(String id) {
    final source = sharedPreferences.getString(id);
    if (source != null) {
      return Future.value(TodoModel.fromJson(source));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<TodoModel> updateTodo(TodoModel todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
