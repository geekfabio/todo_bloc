import 'entity_object.dart';

enum NameError { empty, lenght }

class Name implements EntityObject<String, NameError> {
  Name(this.value) {
    _error = validate(value);
    if (_error == null) _isValid = true;
  }
  late NameError? _error;
  late bool _isValid;

  @override
  String value;

  @override
  NameError? get error => _error;

  @override
  bool get isValid => _isValid;

  static validate(String value) {
    if (value.isEmpty) {
      return NameError.empty;
    } else if (value.length < 2) {
      return NameError.lenght;
    }
    return null;
  }
}
