import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/add_todo.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late MockTodoRepository mockRepositoryTodo;
  late AddTodo usecase;

  setUp(() {
    mockRepositoryTodo = MockTodoRepository();
    usecase = AddTodo(repository: mockRepositoryTodo);
  });

  final tTdodoItem = TodoItem(
    id: '1',
    title: 'title',
    dateCreated: 'description',
    isDone: false,
  );

  test("when add a Todo return true", () async {
    //arrange

    when(() => mockRepositoryTodo.addTodo(tTdodoItem))
        .thenAnswer((_) async => const Right<Failure, bool>(true));

    //act
    final result = await usecase((tTdodoItem));
    //assert

    expect(result, const Right<Failure, bool>(true));
    verify(() => mockRepositoryTodo.addTodo(tTdodoItem));
    verifyNoMoreInteractions(mockRepositoryTodo);
  });
}
