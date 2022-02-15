import 'package:equatable/equatable.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';

class GetAllTodo extends Equatable {
  final ITodoRepository repository;
  GetAllTodo({required this.repository});

  //Call(ITodoRepository repository) => repository.getAllTodo()),

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
