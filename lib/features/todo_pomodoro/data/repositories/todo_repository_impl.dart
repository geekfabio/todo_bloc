import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/datasources/local_data_source.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> addTodo(TodoItem todo) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TodoItem>> deleteTodo(TodoItem todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, KtList<TodoItem>>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TodoItem>> getTodoById({required String id}) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TodoItem>> updateTodo(TodoItem todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
