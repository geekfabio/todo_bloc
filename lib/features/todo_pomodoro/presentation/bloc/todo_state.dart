part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoModel> listTodo;
  const TodoLoadedState({required this.listTodo});

  @override
  List<Object> get props => [listTodo];
}

class TodoErrorState extends TodoState {
  final String errorMessage;
  const TodoErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}

class TodoEmptyList extends TodoState {}
