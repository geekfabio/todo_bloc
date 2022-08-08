import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/add_todo.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/get_all_todo.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/update_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase addTodoUseCase;
  final UpdateTodo updateTodoUseCase;
  final GetAllTodo getAllTodo;

  final listTodo = <TodoModel>[];
  int get listCount => listTodo.length;
  TodoBloc(
      {required this.getAllTodo,
      required this.updateTodoUseCase,
      required this.addTodoUseCase})
      : super(TodoLoadingState()) {
    // ignore: void_checks
    on<TodoFetchList>((event, emit) async {
      try {
        final result = await getAllTodo(NoParams());
        if (result.isRight()) {
          // ! TODO implement this best pratice to clean code
          // result.fold((l) => CacheFailure(), (r) => null);

          List<TodoEntity> listEntity = result.getOrElse(() => []);
          //To clean the list
          listTodo.clear();
          listTodo.addAll(listEntity.map((e) => TodoModel.fromTodoEntity(e)));
          //To clean the list
          listEntity.clear();
          emit(TodoLoadedState(listTodo: listTodo));
        } else {
          emit(const TodoErrorState(errorMessage: "Error adding todo"));
        }
      } on CacheFailure {
        emit(const TodoErrorState(errorMessage: "Error adding todo"));
      }
    });
    on<TodoAdded>((event, emit) async {
      try {
        final result = await addTodoUseCase(event.todo);
        if (result.isRight()) {
          listTodo.add(TodoModel.fromTodoEntity(event.todo));
          emit(TodoLoadedState(listTodo: listTodo));
        } else {
          emit(const TodoErrorState(errorMessage: "Error adding todo"));
        }
      } on CacheFailure {
        emit(const TodoErrorState(errorMessage: "Error adding todo"));
      }
    });
    on<TodoUpdated>((event, emit) async {
      try {
        final result =
            await updateTodoUseCase(ParamsTodoItem(todo: event.todo));
        if (result.isRight()) {
          //remove da lista
          listTodo.removeWhere((todo) => todo.id == event.todo.id);
          //add na lista o item atualizado
          listTodo.add(event.todo);
          emit(TodoLoadedState(listTodo: listTodo));
        } else {
          emit(const TodoErrorState(errorMessage: "Update todo failed"));
        }
      } on CacheFailure {
        emit(const TodoErrorState(
            errorMessage: "updateTodoUseCase todo failed"));
      }
    });
  }
}
