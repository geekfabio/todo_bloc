import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo_item.dart';
import '../repositories/todo_repository.dart';

class GetAllTodo extends UseCase<KtList<TodoItem>, NoParams> {
  final TodoRepository repository;
  GetAllTodo({required this.repository});

  @override
  Future<Either<Failure, KtList<TodoItem>>> call(NoParams params) async {
    return await repository.getAllTodos();
  }
}
