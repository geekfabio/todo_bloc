import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo_item.dart';
import '../repositories/todo_repository.dart';

class GetTodoByID implements UseCase<TodoItem, Params> {
  final TodoRepository repository;
  const GetTodoByID({required this.repository});

  @override
  Future<Either<Failure, TodoItem>> call(Params params) async =>
      await repository.getTodoById(id: params.id);
}

class Params extends Equatable {
  final String id;
  const Params({required this.id});
  @override
  List<Object> get props => [id];
}
