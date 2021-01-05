import 'package:enquete_dev/presentation/protocols/protocols.dart';
import 'package:enquete_dev/validation/protocols/field_validation.dart';
import 'package:enquete_dev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ];
}
