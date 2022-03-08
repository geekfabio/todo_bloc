import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/core/error/exceptions.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/datasources/local_data_source.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/mapper/todo_mapper.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';

import '../../../../json/json_file_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late TodoLocalDataSourceImpl dataSource;
  SharedPreferences? preference;

  setUp(() async {
    preference = await SharedPreferences.getInstance();
    dataSource = TodoLocalDataSourceImpl(
      sharedPreferences: preference!,
    );
    SharedPreferences.setMockInitialValues({});
  });
  const String _sharedKey = "todo_shared_key";
  final jsonString =
      jsonDecode(jsonFileReader("todo_list.json")).cast<Map<String, dynamic>>();

  final list =
      jsonString.map((e) => TodoModel.fromMap(e)).toList().cast<TodoModel>();
  const tTdodoItem = TodoModel(
    id: '1',
    title: 'title',
    dateCreated: 'description',
    isDone: false,
  );
  group("Test save TodoModel in local data source", () {
    test("should add TodoModel in local data source", () async {
      // arrange

      // act

      // assert
    });

    test("addTodoModel", () async {
      //kkk desisto
    });
  });

  group('Test local data source', () {
    const tId = "1";
    const tNullParam = "Null";

    test(
      "Quando o método getAll é chamado, deve retornar uma lista Vazia",
      () sync* {
        when(() => dataSource.getAllTodo())
            .thenAnswer((_) async => List.empty());
        final result = dataSource.getAllTodo();
        expect(result, List.empty());
      },
    );

    test(
      "Quando o método getAll é chamada, deve retornar uma lista de TodoModel",
      () sync* {
        TodosListModel todosListModel = TodosListModel(list: list);

        List<TodoModel> listx = todosListModel.list;

        when(() => dataSource.getAllTodo()).thenAnswer((_) async => listx);

        final result = dataSource.getAllTodo();
        expect(result, listx);
      },
    );

    //Sucess
    test(
      "Quando o método getById é chamado deve retornar uma TodoModel",
      () sync* {
        when(() => dataSource.getTodoById(tId))
            .thenAnswer((_) async => tTdodoItem);
        final result = dataSource.getTodoById(tId);
        expect(result, equals(list));
      },
    );
    //Exception
    test("Quando o método getById é nullo retornar CacheException", () sync* {
      when(() async => dataSource.getTodoById(any()))
          .thenThrow(CacheException());
      final result = dataSource.getTodoById(tId);
      expect(result, isException);
    });
  });
}
