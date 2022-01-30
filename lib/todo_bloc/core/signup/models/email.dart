import 'package:todo_bloc/todo_bloc/core/signup/entity_object.dart';

enum EmailError { empty, invalid }

class Email implements EntityObject<String, EmailError> {
  Email(this.value) {
    _error = validate(value);
    if (_error == null) _isValid = true;
  }

  late EmailError? _error;
  late bool _isValid;

  @override
  String value;

  @override
  EmailError? get error => _error;

  @override
  bool get isValid => _isValid;

  static validate(String value) {
    final lengthRgx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value.isEmpty) {
      return EmailError.empty;
    }
    if (!lengthRgx.hasMatch(value)) {
      return EmailError.invalid;
    }
    return null;
  }
}
