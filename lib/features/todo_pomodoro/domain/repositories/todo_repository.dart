import 'package:kt_dart/collection.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:dartz/dartz.dart';

abstract class ITodoRepository {
  Future<Either<Failure, TodoItem>> getTodoById({required String id});
  Future<Either<TodoFailure, KtList<TodoItem>>> getAllTodos();
  Future<Either<TodoFailure, TodoItem>> addTodo(TodoItem todo);
  Future<Either<TodoFailure, TodoItem>> updateTodo(TodoItem todo);
  Future<Either<TodoFailure, TodoItem>> deleteTodo(TodoItem todo);
}
