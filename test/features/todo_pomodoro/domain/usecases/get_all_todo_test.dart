import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/get_all_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late MockTodoRepository mockRepositoryTodo;
  late GetAllTodo usecase;

  setUp(() {
    mockRepositoryTodo = MockTodoRepository();
    usecase = GetAllTodo(repository: mockRepositoryTodo);
  });

  //generate  a list of TodoItem
  final list = KtList.from(List.generate(
      10,
      (index) => TodoEntity(
          id: "$index", title: "$index", dateCreated: "$index", isDone: true)));
  test("when call getAllTodos return a List of KtList", () async {
    //arrange
    when(() => mockRepositoryTodo.getAllTodos())
        .thenAnswer((_) async => Right<Failure, KtList<TodoEntity>>(list));
    //act
    final result = await usecase(NoParams());
    //assert
    expect(result, Right<Failure, KtList<TodoEntity>>(list));
  });
}
