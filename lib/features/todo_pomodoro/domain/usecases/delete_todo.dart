import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class DeleteTodo implements UseCase<TodoEntity, ParamsTodoItem> {
  final TodoRepository repository;
  DeleteTodo({required this.repository});

  @override
  Future<Either<Failure, TodoEntity>> call(ParamsTodoItem params) async =>
      await repository.deleteTodo(params.todo);
}
