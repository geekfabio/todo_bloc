import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class GetTodoByID implements UseCase<TodoEntity, Params> {
  final TodoRepository repository;
  const GetTodoByID({required this.repository});

  @override
  Future<Either<Failure, TodoEntity>> call(Params params) async =>
      await repository.getTodoById(id: params.id);
}

class Params extends Equatable {
  final String id;
  const Params({required this.id});
  @override
  List<Object> get props => [id];
}
