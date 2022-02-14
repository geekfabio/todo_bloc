import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

///Quando o erro vem do servidor
class ServerFailure extends Failure {}

///Quando o erro é no Cache
class CacheFailure extends Failure {}
