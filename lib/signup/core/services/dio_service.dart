import 'package:dio/dio.dart';
import 'package:todo_bloc/signup/core/services/ihttp_service.dart';

///Service to use Dio Services
class DioService implements IHttpService {
  final Dio dio;
  DioService(
    this.dio,
  );

  @override
  Future get(String url) async => (await dio.get(url)).data;
}
