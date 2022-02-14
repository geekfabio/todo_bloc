import 'package:kt_dart/collection.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';

abstract class IRepositoryTodo {
  Stream<KtList<TodoItem>> getAllTodos();
  Stream<TodoItem> getTodoById(String id);
  Stream<TodoItem> addTodo(TodoItem todo);
  Stream<TodoItem> updateTodo(TodoItem todo);
  Stream<TodoItem> deleteTodo(TodoItem todo);
}
