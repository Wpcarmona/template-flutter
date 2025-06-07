import 'package:formz/formz.dart';

// Definir errores
enum ConfirmPasswordError { empty, mismatch }

class ConfirmPassword extends FormzInput<String, ConfirmPasswordError> {
  final String originalPassword;

  const ConfirmPassword.pure({this.originalPassword = ''}) : super.pure('');
  const ConfirmPassword.dirty({required String value, required this.originalPassword}) 
    : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == ConfirmPasswordError.empty) return 'El campo es obligatorio';
    if (displayError == ConfirmPasswordError.mismatch) return 'Las contraseñas no coinciden';

    return null;
  }

  @override
  ConfirmPasswordError? validator(String value) {
    final trimmedValue = value.trim();
    final trimmedOriginal = originalPassword.trim();

    if (trimmedValue.isEmpty) return ConfirmPasswordError.empty;
    if (trimmedValue != trimmedOriginal) return ConfirmPasswordError.mismatch;
    return null;
  }
}
