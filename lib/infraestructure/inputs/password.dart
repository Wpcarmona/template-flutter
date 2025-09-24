import 'package:formz/formz.dart';

enum PasswordError { empty, length, format }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');
  const Password.dirty(super.value) : super.dirty();

  static final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[\W_]).{8,}$',
  );

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'El campo es obligatorio';
    if (displayError == PasswordError.length) return 'Debe tener al menos 5 caracteres';
    if (displayError == PasswordError.format) return 'Debe contener una mayúscula y un carácter especial';

    return null;
  }

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 5) return PasswordError.length;
    // if (!passwordRegExp.hasMatch(value)) return PasswordError.format;
    return null;
  }
}
