///Class Abstrata para validação, utilizar em vez de [String, double, int] para maior abstração
abstract class EntityObject<T, ERROR> {
  late T value;
  //return the type of the validation error if have else return null
  ERROR? get error;
  //return true if the value is valid else return false
  bool get isValid;
}
