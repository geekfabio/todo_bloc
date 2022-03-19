import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/core/error/failure.dart';
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

  TodoLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> addTodo(TodoModel todo) async {
    //  List<TodoModel> todoModelSaved = await getAllTodo();

    //  List<String> iListTodoString = Map.from((TodoModel e) => );
    // List<String> objectSerialized =
    //      (todoModelSaved).map((e) => e.toJson()).toList().cast<String>();
    return await sharedPreferences.setStringList(_sharedKey, [todo.toJson()]);
  }

  @override
  Future<bool> addListTodo({required TodosListModel todoList}) {
    return sharedPreferences.setStringList(_sharedKey, [todoList.toJson()]);
  }

  @override
  Future<bool> deleteTodo(TodoModel todo) async {
    List<TodoModel> todoModelSaved = await getAllTodo();
    todoModelSaved.remove(todo);
    //  List<String> iListTodoString = Map.from((TodoModel e) => );
    List<String> objectSerialized =
        (todoModelSaved).map((e) => e.toJson()).toList().cast<String>();
    return await sharedPreferences.setStringList(_sharedKey, objectSerialized);
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    final result = sharedPreferences.getStringList(_sharedKey);
    if (result != null) {
      final List<TodoModel> listOftodoModel =
          result.map((e) => TodoModel.fromJson(e)).toList().cast<TodoModel>();

      return Future.value(listOftodoModel);
    } else {
      return Future.value(List.empty());
    }
  }

  @override
  Future<TodoModel> getTodoById(String id) {
    final source = sharedPreferences.getStringList(id);
    if (source != null) {
      final List<TodoModel> listOftodoModel =
          source.map((e) => TodoModel.fromJson(e)).toList().cast<TodoModel>();
      return Future.value(
          listOftodoModel.firstWhere((element) => element.id == id));
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<bool> updateTodo(TodoModel todo) async {
    final List<TodoModel> todoModelStored = await getAllTodo();
    final TodoModel itemToUpdate;
    itemToUpdate =
        todoModelStored.firstWhere((element) => element.id == todo.id);
    todoModelStored.remove(itemToUpdate);
    todoModelStored.add(todo);
    final List<String> objectSerialized =
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
