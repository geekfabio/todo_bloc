import 'package:todo_bloc/signup/core/signup/entity_object.dart';

//Tipo de erros que podem ser gerados
enum IdNumberError { isEmpty, invalid, length }

///IdNumber Validado, utilizar em vez de String
class IdNumber implements EntityObject<String, IdNumberError> {
  IdNumber(this.value) {
    _error = validate(value);
    if (error == null) _isValid = true;
  }
  late IdNumberError? _error;
  late bool _isValid;

  @override
  late String value;

  @override
  IdNumberError? get error => _error;

  @override
  bool get isValid => _isValid;

  /// Valida o valor passado, retorna o tipo de erro ou null
  static IdNumberError? validate(String value) {
    if (value.isEmpty) {
      return IdNumberError.isEmpty;
      //TODO delete this when Regex is implemented
    } else if (value.length > 13 || value.length < 13) {
      return IdNumberError.length;
    } else if (!value.contains(RegExp(r'[0-9]{9}'))) {
      return IdNumberError.invalid;
    }
    return null;
  }
}
