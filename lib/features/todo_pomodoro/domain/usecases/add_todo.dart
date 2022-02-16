import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo_item.dart';
import '../repositories/todo_repository.dart';

class AddTodo implements UseCase<bool, TodoItem> {
  final ITodoRepository repository;
  AddTodo({required this.repository});

  @override
  Future<Either<Failure, bool>> call(TodoItem params) async =>
      await repository.addTodo(params);
}
