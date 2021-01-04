import 'package:enquete_dev/validation/protocols/field_validation.dart';
import 'package:flutter_test/flutter_test.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  @override
  String validate(String value) {
    return null;
  }
}

void main() {
  test('Should return null if e-mail is empty', () {
    final sut = EmailValidation('any_field');
    final error = sut.validate('');

    expect(error, null);
  });

  test('Should return null if e-mail is null', () {
    final sut = EmailValidation('any_field');
    final error = sut.validate(null);

    expect(error, null);
  });
}
