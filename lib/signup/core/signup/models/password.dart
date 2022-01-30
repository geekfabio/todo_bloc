import 'package:todo_bloc/signup/core/signup/entity_object.dart';

enum PasswordError { empty, lenght }

class Password implements EntityObject<String, PasswordError> {
  Password(this.value) {
    _error = validate(value);
    if (_error == null) _isValid = true;
  }
  late PasswordError? _error;
  late bool _isValid;

  @override
  String value;

  @override
  PasswordError? get error => _error;

  @override
  bool get isValid => _isValid;

  static validate(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    } else if (value.length < 6) {
      return PasswordError.lenght;
    }
    return null;
  }
}
