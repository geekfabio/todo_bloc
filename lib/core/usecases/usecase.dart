import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
//TODO refatorar isto
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';

import '../../core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class ParamsTodoItem extends Equatable {
  //TODO refatorar esta depencia
  final TodoEntity todo;
  const ParamsTodoItem({required this.todo});
  @override
  List<Object> get props => [todo];
}
