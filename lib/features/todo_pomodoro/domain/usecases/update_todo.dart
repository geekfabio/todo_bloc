import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo_item.dart';
import '../repositories/todo_repository.dart';

class UpdateTodo implements UseCase<TodoItem, ParamsTodoItem> {
  final ITodoRepository repository;
  UpdateTodo({required this.repository});
  @override
  Future<Either<Failure, TodoItem>> call(ParamsTodoItem params) async {
    return await repository.updateTodo(params.todo);
  }
}
