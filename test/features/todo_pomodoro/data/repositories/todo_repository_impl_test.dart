import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/services/network_info.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/datasources/local_data_source.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/repositories/todo_repository_impl.dart';

class MockLocalDataSource extends Mock implements TodoLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late TodoRepositoryImpl todoRepositoryImpl;
  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockLocalDataSource();
    todoRepositoryImpl =
        TodoRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  group("Test if user is connected", () {
    test("", () {});
    test("", () {});
    test("", () {});
  });
}
