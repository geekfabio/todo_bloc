import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/usecases/usecase.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/delete_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late MockTodoRepository mockRepositoryTodo;
  late DeleteTodo usecase;

  setUp(() {
    mockRepositoryTodo = MockTodoRepository();
    usecase = DeleteTodo(repository: mockRepositoryTodo);
  });

  const tTodoItem = TodoEntity(
    id: '1',
    title: 'title',
    dateCreated: 'description',
    isDone: false,
  );

  test("when call getTodoById return a TodoItem", () async {
    //arrange

    when(() => mockRepositoryTodo.deleteTodo(tTodoItem))
        .thenAnswer((_) async => const Right<Failure, TodoEntity>(tTodoItem));

    //act
    final result = await usecase(const ParamsTodoItem(todo: tTodoItem));
    //assert

    expect(result, const Right<Failure, TodoEntity>(tTodoItem));
    verify(() => mockRepositoryTodo.deleteTodo(tTodoItem));
    verifyNoMoreInteractions(mockRepositoryTodo);
  });
}
