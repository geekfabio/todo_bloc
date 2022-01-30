import 'package:formz/formz.dart';
import 'package:todo_bloc/signup/core/signup/models/id_number.dart';

class IdNumberInput extends FormzInput<String, IdNumberError> {
  const IdNumberInput.pure() : super.pure('');
  const IdNumberInput.dirty({String value = ''}) : super.dirty(value);

  @override
  IdNumberError? validator(String value) {
    // Utiliza o abstract method IdNumber.validate para validar valor
    return IdNumber.validate(value);
  }
}
