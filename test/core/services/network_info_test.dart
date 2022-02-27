import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/services/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late MockDataConnectionChecker mockDataConnectionChecker;
  late NetworkInfoImpl networkInfoImp;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImp = NetworkInfoImpl(mockDataConnectionChecker);
  });

  test("Test if device have a connection with internet", () async* {
    when(() => mockDataConnectionChecker.hasConnection)
        .thenAnswer((_) async => true);

    //act
    final result = networkInfoImp.isConnected;
    expect(result, true);
    verifyNoMoreInteractions(mockDataConnectionChecker);
  });
}
