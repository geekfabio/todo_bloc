import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class GetAllTodo extends UseCase<List<TodoEntity>, NoParams> {
  final TodoRepository repository;
  GetAllTodo({required this.repository});

  @override
  Future<Either<Failure, List<TodoEntity>>> call(NoParams params) async {
    return await repository.getAllTodos();
  }
}
