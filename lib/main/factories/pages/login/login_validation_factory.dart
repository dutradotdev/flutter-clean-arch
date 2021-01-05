import 'package:enquete_dev/main/builders/validation_builder.dart';
import 'package:enquete_dev/presentation/protocols/protocols.dart';
import 'package:enquete_dev/validation/protocols/field_validation.dart';
import 'package:enquete_dev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
