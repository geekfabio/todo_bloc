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
    SharedPreferences.setMockInitialValues({});
    dataSource = TodoLocalDataSourceImpl(
      sharedPreferences: preference!,
    );
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
      () async {
        TodosListModel todosListModel = TodosListModel(list: list);

        List<TodoModel> listTodo = todosListModel.list;

        SharedPreferences.setMockInitialValues({
          _sharedKey: jsonEncode(listTodo),
        });
        //TODO implemt this
        //  List<String> = preference.getStringList(_sharedKey);

        when(() => dataSource.getAllTodo()).thenAnswer((_) async => listTodo);

        // expect(result, listTodo);
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
    test("Quando o método getById é nullo retornar CacheException", () async {
      when(() async => dataSource.getTodoById(any()))
          .thenThrow(CacheException());
      final result = dataSource.getTodoById(tId);
      expect(result, isException);
    });

    test("Quando o método DeleteTodo é chamado deve eliminar uma Todo",
        () async {
      when(() => dataSource.deleteTodo(tTdodoItem))
          .thenAnswer((_) async => true);
      final result = dataSource.deleteTodo(tTdodoItem);
      expect(result, true);
    });
  });
}
