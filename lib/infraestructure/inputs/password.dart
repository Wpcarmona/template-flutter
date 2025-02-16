import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');

  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == PasswordError.empty) return 'El campo es obligatorio';
    if(displayError == PasswordError.length) return 'El campo debe tener al menos 6 caracteres';

    return null;
  
  }

  @override
  PasswordError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.length;
    return null;
  }
}