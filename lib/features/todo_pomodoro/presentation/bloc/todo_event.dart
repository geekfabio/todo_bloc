part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
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

//Usar para limpar uma lista de tarefas
class TodoCleared extends TodoEvent {
  final List<TodoModel> todos;
  final String project;
  const TodoCleared({required this.project, required this.todos});
  @override
  List<Object> get props => [todos];
}
