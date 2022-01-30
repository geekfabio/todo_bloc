import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/signup/core/signup/models/email.dart';
import 'package:todo_bloc/signup/core/signup/models/id_number.dart';

void main() {
  group("Test IdNumber validator method", () {
    test("When the value is invalid length return IdNumberError", () {
      expect(IdNumber.validate("value"), IdNumberError.length);
    });

    test("When the value is empty return IdNumberError", () {
      expect(IdNumber.validate(""), IdNumberError.isEmpty);
    });
    test("When the value is valid return null", () {
      expect(IdNumber.validate("1234567891235"), null);
    });
  });

  group("Test Email validator method", () {
    test("When the Email is invalid return invalid", () {
      expect(Email.validate("1223@2."), EmailError.invalid);
    });

    test("When the Email is invalid return invalid", () {
      expect(Email.validate("1223@232...2332"), EmailError.invalid);
    });
    test("When the value is empty return error", () {
      expect(Email.validate(""), EmailError.empty);
    });
    test("When the value is valid return null", () {
      expect(Email.validate("adsx@gmail.com"), null);
    });
  });
}
