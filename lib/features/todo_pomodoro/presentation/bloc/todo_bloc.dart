import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/add_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase addTodoUseCase;

//  List<TodoModel> listTodoModel = [];
  final listTodo = <TodoModel>[];
  int get listCount => listTodo.length;
  TodoBloc({required this.addTodoUseCase}) : super(TodoInitial()) {
    // ignore: void_checks
    on<TodoAdded>((event, emit) async {
      emit(TodoLoading());
      Future.delayed(const Duration(seconds: 4));
      try {
        final result = await addTodoUseCase(event.todo);
        if (result.isRight()) {
          listTodo.add(TodoModel.fromTodoEntity(event.todo));
          emit(TodoLoaded(todos: listTodo));
        } else {
          emit(TodoInitial());
        }
      } on CacheFailure {
        emit(TodoInitial());
      }
    });
    on<TodoUpdated>((event, emit) async {
      TodoModel model = const TodoModel(
          id: "1", title: "title", dateCreated: "dateCreated", isDone: false);
      listTodo.add(event.todo);
      debugPrint(listTodo.length.toString());
      debugPrint("Update");
      emit(TodoLoaded(todos: listTodo));
    });
  }
}
