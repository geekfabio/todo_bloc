import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  List<Object?> get props => [];
}

///Quando o erro vem do servidor
class ServerFailure extends Failure {}

///Quando o erro é no armazenamento Local
class CacheFailure extends Failure {}

///Possiveis erros de requisição da Todo
class TodoFailure extends Failure {
  const TodoFailure() : super();
  factory TodoFailure.unexpected() {
    return const TodoFailure();
  }
  factory TodoFailure.insuficientPermission() {
    return const TodoFailure();
  }
  factory TodoFailure.errorDeleting() {
    return const TodoFailure();
  }
}
