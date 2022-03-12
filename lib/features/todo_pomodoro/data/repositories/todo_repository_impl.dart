import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/datasources/local_data_source.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  //final NetworkInfo networkInfo;
  TodoRepositoryImpl({required this.localDataSource});

  /// add [TodoEntity], on the local cache. Otherwise return a failure
  @override
  Future<Either<Failure, bool>> addTodo(TodoEntity todo) async {
    try {
      final result =
          await localDataSource.addTodo(TodoModel.fromTodoEntity(todo));
      return Right<Failure, bool>(result);
    } on CacheFailure {
      return Left(CacheFailure());
    } on Failure {
      return Left(CacheFailure());
    }
  }

  /// deleteTodo [TodoEntity] on the local cache. Otherwise return a failure
  @override
  Future<Either<Failure, bool>> deleteTodo(TodoEntity todo) async {
    try {
      final result =
          await localDataSource.deleteTodo(TodoModel.fromTodoEntity(todo));
      return Right<Failure, bool>(result);
    } on CacheFailure {
      return Left<Failure, bool>(CacheFailure());
    }
  }

  ///
  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTodos() async {
    try {
      final result = await localDataSource.getAllTodo();
      return Right<Failure, List<TodoEntity>>(result);
    } on CacheFailure {
      return Left<Failure, List<TodoEntity>>(CacheFailure());
    }
  }

  /// get a [TodoEntity] by id. Otherwise return a failure
  @override
  Future<Either<Failure, TodoEntity>> getTodoById({required String id}) async {
    try {
      final result = await localDataSource.getTodoById(id);
      return Right<Failure, TodoEntity>(result);
    } on CacheFailure {
      return Left<Failure, TodoEntity>(CacheFailure());
    }
  }

  /// update a [TodoEntity]. Otherwise return a failure
  @override
  Future<Either<Failure, bool>> updateTodo(TodoEntity todo) async {
    try {
      final result =
          await localDataSource.updateTodo(TodoModel.fromTodoEntity(todo));
      return Right<Failure, bool>(result);
    } on CacheFailure {
      return Left<Failure, bool>(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodoByProject(
      String project) async {
    try {
      final result = await localDataSource.getTodoByProject(project);
      return Right<Failure, List<TodoEntity>>(result);
    } on CacheFailure {
      return Left<Failure, List<TodoEntity>>(CacheFailure());
    }
  }
}
