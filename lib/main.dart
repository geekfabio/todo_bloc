import 'package:flutter/material.dart';
import 'package:todo_bloc/my_app.dart';
import 'package:todo_bloc/signup/core/repository/app_signup_repository.dart';

import 'signup/core/repository/signup_repository.dart';

SignupRepository _signupRepository = AppSignupRepositoy();
void main() {
  runApp(MyApp(
    repository: _signupRepository,
  ));
}
