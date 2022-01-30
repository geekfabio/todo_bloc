import 'package:formz/formz.dart';
import 'package:todo_bloc/signup/core/signup/models/email.dart';

class EmailInput extends FormzInput<String, EmailError> {
  EmailInput.pure(String value) : super.pure(value);

  EmailInput.dirty(String value) : super.dirty('');

  @override
  EmailError? validator(String value) {
    return Email.validate(value);
  }
}
