import 'package:enquete_dev/validation/protocols/field_validation.dart';
import 'package:enquete_dev/validation/validators/validation_composite.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class FieldValidationSpy extends Mock implements FieldValidation {}

void main() {
  FieldValidationSpy fieldValidation1;
  FieldValidationSpy fieldValidation2;
  FieldValidationSpy fieldValidation3;
  ValidationComposite sut;

  void mockValidation1(String error) {
    when(fieldValidation1.validate(any)).thenReturn(error);
  }

  void mockValidation2(String error) {
    when(fieldValidation2.validate(any)).thenReturn(error);
  }

  void mockValidation3(String error) {
    when(fieldValidation3.validate(any)).thenReturn(error);
  }

  setUp(() {
    fieldValidation1 = FieldValidationSpy();
    when(fieldValidation1.field).thenReturn('other_field');
    mockValidation1(null);
    fieldValidation2 = FieldValidationSpy();
    when(fieldValidation2.field).thenReturn('any_field');
    mockValidation2(null);
    fieldValidation3 = FieldValidationSpy();
    when(fieldValidation3.field).thenReturn('any_field');
    mockValidation3(null);
    sut = ValidationComposite(
        [fieldValidation1, fieldValidation2, fieldValidation3]);
  });
  test('Should return null if all validators returns null or empty', () {
    mockValidation2('');
    final error = sut.validate(field: 'any_field', value: 'any_value');
    expect(error, null);
  });

  test('Should return the first error of the field', () {
    mockValidation1('error_1');
    mockValidation2('error_2');
    mockValidation3('error_3');
    final error = sut.validate(field: 'any_field', value: 'any_value');
    expect(error, 'error_2');
  });
}
