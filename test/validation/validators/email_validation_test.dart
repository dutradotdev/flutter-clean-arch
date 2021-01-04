import 'package:enquete_dev/validation/validators/email_validator.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });
  test('Should return null if e-mail is empty', () {
    expect(sut.validate(''), null);
  });

  test('Should return null if e-mail is null', () {
    expect(sut.validate(null), null);
  });

  test('Should return null if e-mail is valid', () {
    expect(sut.validate(faker.internet.email()), null);
  });

  test('Should return error if e-mail is valid', () {
    expect(sut.validate('teste.errado'), 'Campo inválido');
  });
}
