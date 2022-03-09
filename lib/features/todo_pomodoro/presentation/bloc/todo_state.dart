part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoadedByProject extends TodoState {
  final List<TodoModel> todos;
  const TodoLoadedByProject({required this.todos});
  @override
  List<Object> get props => [todos];
}

class TodoLoadedAll extends TodoState {
  final List<TodoModel> todos;
  const TodoLoadedAll({required this.todos});
  @override
  List<Object> get props => [todos];
}
