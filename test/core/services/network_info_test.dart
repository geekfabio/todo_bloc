import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_bloc/core/services/network_info.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

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
    final result = await networkInfoImp.isConnected;
    expect(result, true);
    verifyNoMoreInteractions(mockDataConnectionChecker);
  });
}
