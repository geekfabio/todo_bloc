import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_bloc/signup/core/services/ihttp_service.dart';
import 'ihttp_service.dart';

///HTTP Client to use HTTP Services
class HttpService implements IHttpService {
  final http.Client client;

  HttpService(
    this.client,
  );

  @override
  Future get(String url) async => await client.get(Uri.parse(url));
}
