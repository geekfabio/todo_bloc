import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/update_todo.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late MockTodoRepository mockRepositoryTodo;
  late UpdateTodo usecase;

  setUp(() {
    mockRepositoryTodo = MockTodoRepository();
    usecase = UpdateTodo(repository: mockRepositoryTodo);
  });

  final tTodoItem = TodoItem(
    id: '1',
    title: 'title',
    dateCreated: 'description',
    isDone: false,
  );

  test("when call updateTodo update a TodoItem", () async {
    //arrange

    when(() => mockRepositoryTodo.updateTodo(tTodoItem))
        .thenAnswer((_) async => Right<Failure, TodoItem>(tTodoItem));

    //act
    final result = await usecase(ParamsTodoItem(todo: tTodoItem));
    //assert

    expect(result, Right<Failure, TodoItem>(tTodoItem));
    verify(() => mockRepositoryTodo.updateTodo(tTodoItem));
    verifyNoMoreInteractions(mockRepositoryTodo);
  });
}
