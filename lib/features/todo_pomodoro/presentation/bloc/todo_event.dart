part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoEvent {
  final List<TodoModel> todos;
  const TodoLoaded({required this.todos});
  @override
  List<Object> get props => [todos];
}

class TodoAdded extends TodoEvent {
  final TodoModel todo;
  const TodoAdded({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoUpdated extends TodoEvent {
  final TodoModel todo;
  const TodoUpdated({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoDeleted extends TodoEvent {
  final TodoModel todo;
  const TodoDeleted({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoCompleted extends TodoEvent {
  final TodoModel todo;
  const TodoCompleted({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoUncompleted extends TodoEvent {
  final TodoModel todo;
  const TodoUncompleted({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoCleared extends TodoEvent {
  final List<TodoModel> todos;
  const TodoCleared({required this.todos});
  @override
  List<Object> get props => [todos];
}

class TodoFilterChanged extends TodoEvent {
  final TodoFilter filter;
  const TodoFilterChanged({required this.filter});
  @override
  List<Object> get props => [filter];
}

class TodoSortChanged extends TodoEvent {
  final TodoSort sort;
  const TodoSortChanged({required this.sort});
  @override
  List<Object> get props => [sort];
}

enum TodoSort {
  title,
  date,
}

enum TodoFilter {
  all,
  active,
  completed,
}
