import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> list = List.empty(growable: true);

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      if (event is TodoAdded) {
        list.add(event.todo);
        emit(TodoLoadedByProject(todos: list));
      } else if (event is TodoDeleted) {
        list.remove(event.todo);
        emit(TodoLoadedByProject(todos: list));
      } else if (event is TodoUpdated) {
        list.remove(event.todo);
        list.add(event.todo);
        emit(TodoLoadedByProject(todos: list));
      } else if (event is TodoLoadedByProject) {
        emit(TodoLoadedByProject(todos: list));
      }
    });
  }
}
