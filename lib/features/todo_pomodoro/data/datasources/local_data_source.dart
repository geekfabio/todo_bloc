import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/core/error/exceptions.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/mapper/todo_mapper.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<bool> addTodo(TodoModel todo);
  Future<bool> addListTodo({required TodosListModel todoList});
  Future<bool> updateTodo(TodoModel todo);
  Future<bool> deleteTodo(TodoModel todo);
  Future<TodoModel> getTodoById(String id);
  Future<List<TodoModel>> getAllTodo();
  Future<List<TodoModel>> getTodoByProject(String project);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final String _sharedKey = "todo_shared_key";
  final SharedPreferences sharedPreferences;
  // ? Store the List Of TodoModel
  late List<TodoModel>? _listTodoModel;

  TodoLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> addTodo(TodoModel todo) async {
    List<TodoModel> todoModelSaved = await getAllTodo();
    todoModelSaved.add(todo);
    //  List<String> iListTodoString = Map.from((TodoModel e) => );
    List<String> objectSerialized =
        (todoModelSaved).map((e) => e.toJson()).toList().cast<String>();
    return await sharedPreferences.setStringList(_sharedKey, objectSerialized);
  }

  @override
  Future<bool> addListTodo({required TodosListModel todoList}) {
    return sharedPreferences.setString(_sharedKey, todoList.toJson());
  }

  @override
  Future<bool> deleteTodo(TodoModel todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    if (_listTodoModel != null) return Future.value(_listTodoModel);
    final result = sharedPreferences.getString(_sharedKey);
    if (result != null) {
      final json = jsonDecode(result);
      final list = (json as List)
          .map((e) => TodoModel.fromJson(e))
          .toList()
          .cast<TodoModel>();
      _listTodoModel = list;
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
  Future<bool> updateTodo(TodoModel todo) async {
    List<TodoModel> todoModelStored = await getAllTodo();
    TodoModel itemToUpdate;
    itemToUpdate =
        todoModelStored.firstWhere((element) => element.id == todo.id);
    todoModelStored.remove(itemToUpdate);
    todoModelStored.add(todo);
    List<String> objectSerialized =
        (todoModelStored).map((e) => e.toJson()).toList().cast<String>();
    return await sharedPreferences.setStringList(_sharedKey, objectSerialized);
  }

  @override
  Future<List<TodoModel>> getTodoByProject(String project) {
    //retorna a lista guardada apenas do projeto especificado
    final result = sharedPreferences.getString(project);
    if (result != null) {
      final json = jsonDecode(result);
      final list = (json as List)
          .map((e) => TodoModel.fromJson(e).project == project)
          .toList()
          .cast<TodoModel>();

      return Future.value(list);
    } else {
      return Future.value(List.empty());
    }
  }
}
