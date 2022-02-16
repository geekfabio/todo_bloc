import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class GetAllTodo extends UseCase<KtList<TodoItem>, NoParams> {
  final ITodoRepository repository;
  GetAllTodo({required this.repository});

  @override
  Future<Either<Failure, KtList<TodoItem>>> call(NoParams params) {
    return repository.getAllTodos();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
