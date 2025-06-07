import 'package:formz/formz.dart';

enum TextError { empty }

class TextInputValidate extends FormzInput<String, TextError> {
  const TextInputValidate.pure() : super.pure('');
  const TextInputValidate.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == TextError.empty) return 'El campo es obligatorio';
    return null;
  }

  @override
  TextError? validator(String value) {
    return value.trim().isEmpty ? TextError.empty : null;
  }
}
