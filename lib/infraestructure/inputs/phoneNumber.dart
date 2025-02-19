import 'package:formz/formz.dart';

enum PhoneNumberError { empty, length }

class PhoneNumber extends FormzInput<String, PhoneNumberError> {
  const PhoneNumber.pure() : super.pure('');

  const PhoneNumber.dirty(String value ) : super.dirty(value);

  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == PhoneNumberError.empty) return 'El campo es obligatorio';
    if(displayError == PhoneNumberError.length) return 'El campo debe tener al menos 6 caracteres';

    return null;
  
  }

  @override
  PhoneNumberError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return PhoneNumberError.empty;
    if(value.length < 6) return PhoneNumberError.length;

    return null;
  }
}