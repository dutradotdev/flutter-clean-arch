import 'package:enquete_dev/presentation/protocols/protocols.dart';
import 'package:enquete_dev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite([
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ]);
}
