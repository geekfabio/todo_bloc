import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';

abstract class ITodoRepository {
  Future<Either<Failure, TodoItem>> getTodoById({required String id});
  Future<Either<Failure, KtList<TodoItem>>> getAllTodos();
  Future<Either<Failure, TodoItem>> addTodo(TodoItem todo);
  Future<Either<Failure, TodoItem>> updateTodo(TodoItem todo);
  Future<Either<Failure, TodoItem>> deleteTodo(TodoItem todo);
}
