import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/get_todo_by_id.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late MockTodoRepository mockRepositoryTodo;
  late GetTodoByID usecase;

  setUp(() {
    mockRepositoryTodo = MockTodoRepository();
    usecase = GetTodoByID(repository: mockRepositoryTodo);
  });

  const tId = "1";
  const tTdodoItem = TodoItem(
    id: '1',
    title: 'title',
    dateCreated: 'description',
    isDone: false,
  );

  test("when call getTodoById return a TodoItem", () async {
    //arrange

    when(() => mockRepositoryTodo.getTodoById(id: tId))
        .thenAnswer((_) async => const Right<Failure, TodoItem>(tTdodoItem));

    //act
    final result = await usecase(const Params(id: tId));
    //assert

    expect(result, const Right<Failure, TodoItem>(tTdodoItem));
    verify(() => mockRepositoryTodo.getTodoById(id: tId));
    verifyNoMoreInteractions(mockRepositoryTodo);
  });
}
