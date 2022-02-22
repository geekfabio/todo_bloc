import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/datasources/local_data_source.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  TodoRepositoryImpl({required this.localDataSource});

  /// add [TodoEntity], on the local cache. Otherwise return a failure
  @override
  Future<Either<Failure, bool>> addTodo(TodoEntity todo) {
    throw UnimplementedError();
  }

  /// deleteTodo [TodoEntity] on the local cache. Otherwise return a failure
  @override
  Future<Either<Failure, TodoEntity>> deleteTodo(TodoEntity todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  /// get a list of [TodoEntity]. Otherwise return a failure
  @override
  Future<Either<Failure, KtList<TodoEntity>>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  //TODO refactor this method
  /// get a item [TodoEntity] by id[String]. Otherwise return a failure
  @override
  Future<Either<Failure, TodoEntity>> getTodoById({required String id}) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  /// update a [TodoEntity]. Otherwise return a failure
  @override
  Future<Either<Failure, TodoEntity>> updateTodo(TodoEntity todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
