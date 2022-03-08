import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/error/failure.dart';
import 'package:todo_bloc/core/services/network_info.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/datasources/local_data_source.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/repositories/todo_repository_impl.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_entity.dart';

class MockLocalDataSource extends Mock implements TodoLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late TodoRepositoryImpl todoRepositoryImpl;

  const tTodoModel = TodoModel(
      id: "1",
      title: "title",
      dateCreated: "1",
      dateFinish: "1",
      dateToStart: "1",
      project: "Task",
      isDone: false);

  const TodoEntity tTodoEntity = tTodoModel;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockLocalDataSource();
    todoRepositoryImpl = TodoRepositoryImpl(
        localDataSource: mockLocalDataSource, networkInfo: mockNetworkInfo);
  });

  group("Test repository methods", () {
    test("Deve adicionar TodoModel do LocalDataSource", () async {
      //arrange
      when(() => mockLocalDataSource.addTodo(tTodoModel))
          .thenAnswer((_) async => true);
      //act
      final result = await todoRepositoryImpl.addTodo(tTodoEntity);
      //assert
      expect(result, equals(const Right<Failure, bool>(true)));
      verify(() => mockLocalDataSource.addTodo(tTodoModel)).called(1);
      verifyNoMoreInteractions(mockLocalDataSource);
    });
    test("Deve remover uma TodoModel do LocalDataSource", () async {
      //arrange
      when(() => mockLocalDataSource.deleteTodo(tTodoModel))
          .thenAnswer((_) async => true);
      //act
      final result = await todoRepositoryImpl.deleteTodo(tTodoModel);
      //assert
      expect(result, equals(const Right<Failure, bool>(true)));
      verify(() => mockLocalDataSource.deleteTodo(tTodoModel));
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test("Deve atualizar uma TodoModel do LocalDataSource", () async {
      //arrange
      when(() => mockLocalDataSource.updateTodo(tTodoModel))
          .thenAnswer((_) async => true);
      //act
      final result = await todoRepositoryImpl.updateTodo(tTodoModel);
      //assert
      expect(result, equals(const Right<Failure, bool>(true)));

      verify(() => mockLocalDataSource.updateTodo(tTodoModel));
      verifyNoMoreInteractions(mockLocalDataSource);
    });
  });

  group("Test GetAllTodos cases", () {
    final listTodo = List.generate(
        10,
        (index) => TodoModel(
            id: "$index",
            title: "$index",
            dateCreated: "$index",
            isDone: true));

    //Sucess Test
    test(
        "getTodoByProject uma lista de TodoModel se contem o parametro passado",
        () async {
      //arrange
      when(() => mockLocalDataSource.getTodoByProject("Task"))
          .thenAnswer((_) async => (listTodo));
      //act
      final result = await todoRepositoryImpl.getTodoByProject("Task");
      //assert
      expect(result, equals(Right<Failure, List<TodoModel>>(listTodo)));
      verify(() => mockLocalDataSource.getTodoByProject("Task"));
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test("getAllTodo uma lista de TodoModel se contem o parametro passado",
        () async {
      //arrange
      when(() => mockLocalDataSource.getAllTodo())
          .thenAnswer((_) async => (listTodo));
      //act
      final result = await todoRepositoryImpl.getAllTodos();
      //assert
      expect(result, equals(Right<Failure, List<TodoModel>>(listTodo)));
      verify(() => mockLocalDataSource.getAllTodo());
      verifyNoMoreInteractions(mockLocalDataSource);
    });
    //Failures Test

    test("Deve retornar uma lista de TodoModel do LocalDataSource", () async {
      //arrange
      when(() => mockLocalDataSource.getAllTodo())
          .thenAnswer((_) async => (listTodo));
      //act
      final result = await todoRepositoryImpl.getAllTodos();
      //assert
      expect(result, equals(Right<Failure, List<TodoModel>>(listTodo)));
      verify(() => mockLocalDataSource.getAllTodo());
      verifyNoMoreInteractions(mockLocalDataSource);
    });
    //Failures Test
  });

  group(
    "Test getByID cases",
    () {
      const tId = "1";

      test("Deve retornar TodoModel quando ser requisitado", () async {
        when(() => mockLocalDataSource.getTodoById(tId))
            .thenAnswer((_) async => tTodoModel);
        //act
        final result = await todoRepositoryImpl.getTodoById(id: tId);
        //assert
        expect(result, equals(const Right<Failure, TodoModel>(tTodoModel)));

        verify(() => mockLocalDataSource.getTodoById(tId));
        verifyNoMoreInteractions(mockLocalDataSource);
      });
    },
  );
}
