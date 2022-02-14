import 'package:kt_dart/collection.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:dartz/dartz.dart';

abstract class IRepositoryTodo {
  Stream<Either<TodoFailure, KtList<TodoItem>>> getAllTodos();
  Stream<Either<TodoFailure, TodoItem>> getTodoById(String id);
  Stream<Either<TodoFailure, TodoItem>> addTodo(TodoItem todo);
  Stream<Either<TodoFailure, TodoItem>> updateTodo(TodoItem todo);
  Stream<Either<TodoFailure, TodoItem>> deleteTodo(TodoItem todo);
}
