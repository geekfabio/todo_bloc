import 'package:todo_bloc/signup/core/repository/signup_repository.dart';
import 'package:todo_bloc/signup/core/services/http_service.dart';
import 'package:http/http.dart' as http;
import 'package:todo_bloc/signup/core/services/api_provider.dart';
import 'package:todo_bloc/signup/presentation/screens/models/signup/user_model.dart';

class AppSignupRepositoy implements SignupRepository {
  late HttpService _httpService;

  final client = http.Client();
  @override
  Future<UserModel> updateUserInfo(String idNumber) async {
    _httpService = HttpService(client);
    ApiProvider _api = ApiProvider(httpService: _httpService);
    return await _api.fetchUserInfoByIdNumber(idNumber);
  }

  @override
  // TODO: implement status
  Stream<SignupStatus> get status => throw UnimplementedError();
}
