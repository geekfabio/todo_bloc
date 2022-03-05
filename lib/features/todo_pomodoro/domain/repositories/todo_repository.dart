import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, TodoEntity>> getTodoById({required String id});
  Future<Either<Failure, List<TodoEntity>>> getAllTodos();
  Future<Either<Failure, List<TodoEntity>>> getTodoByProject(String project);
  Future<Either<Failure, bool>> addTodo(TodoEntity todo);
  Future<Either<Failure, TodoEntity>> updateTodo(TodoEntity todo);
  Future<Either<Failure, TodoEntity>> deleteTodo(TodoEntity todo);
}
