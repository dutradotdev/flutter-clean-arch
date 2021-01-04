import 'package:enquete_dev/validation/protocols/field_validation.dart';

class RequiredFieldValidation implements FieldValidation {
  String field;

  RequiredFieldValidation(this.field);

  @override
  String validate(String value) {
    return value?.isEmpty == false ? null : 'Campo obrigatório.';
  }
}
