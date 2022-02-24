import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, TodoEntity>> getTodoById({required String id});
  Future<Either<Failure, KtList<TodoEntity>>> getAllTodos();
  Future<Either<Failure, bool>> addTodo(TodoEntity todo);
  Future<Either<Failure, TodoEntity>> updateTodo(TodoEntity todo);
  Future<Either<Failure, TodoEntity>> deleteTodo(TodoEntity todo);
}
