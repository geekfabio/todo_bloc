import 'package:todo_bloc/signup/presentation/screens/models/signup/user_model.dart';

enum SignupStatus { loading, processed }

abstract class SignupRepository {
  Stream<SignupStatus> get status;
  Future<UserModel> updateUserInfo(String idNumber);
}
