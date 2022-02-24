import 'package:kt_dart/kt.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<bool> addTodo(TodoModel todo) {
    return Future.delayed(const Duration(microseconds: 1));
  }

  Future<TodoModel> updateTodo(TodoModel todo) {
    return Future.delayed(const Duration(microseconds: 1));
  }

  Future<TodoModel> deleteTodo(TodoModel todo) {
    return Future.delayed(const Duration(microseconds: 1));
  }

  Future<TodoModel> getTodoById({required String id}) {
    return Future.delayed(const Duration(microseconds: 1));
  }

  Future<KtList<TodoModel>> getAllTodo() {
    return Future.delayed(const Duration(microseconds: 1));
  }
}
