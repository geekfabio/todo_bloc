import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class AddTodoUseCase implements UseCase<bool, TodoEntity> {
  final TodoRepository repository;
  AddTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(TodoEntity params) async =>
      await repository.addTodo(params);
}
