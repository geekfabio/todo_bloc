import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/signup/core/services/api_provider.dart';
import 'package:todo_bloc/signup/core/services/dio_service.dart';
import 'package:todo_bloc/signup/core/services/http_service.dart';
import 'package:todo_bloc/signup/presentation/screens/models/signup/user_model.dart';
import 'package:http/http.dart' as http;

void main() {
  late ApiProvider api;
  late HttpService httpService;
  final client = http.Client();
  setUp(() {
    httpService = HttpService(client);
    api = ApiProvider(httpService: httpService);
  });
  test("Get info of user by IDcard Number", () async {
    expect(
        await api.fetchUserInfoByIdNumber("004992251LS042"), isA<UserModel>());
  });

  test("When id card is invalid return Not found", () async {
    expect(() async => (await api.fetchUserInfoByIdNumber("00X4992251LS042")),
        throwsA(isA<ApiProviderError>()));
  });
}
