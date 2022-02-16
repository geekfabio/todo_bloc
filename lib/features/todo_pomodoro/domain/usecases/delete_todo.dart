import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class DeleteTodo implements UseCase<TodoItem, ParamsTodoItem> {
  final ITodoRepository repository;
  DeleteTodo({required this.repository});

  @override
  Future<Either<Failure, TodoItem>> call(ParamsTodoItem params) async {
    return repository.deleteTodo(params.todo);
  }
}
