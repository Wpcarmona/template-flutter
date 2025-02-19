import 'package:formz/formz.dart';

enum NumberDocumentError { empty, length }

class NumberDocument extends FormzInput<String, NumberDocumentError> {
  const NumberDocument.pure() : super.pure('');

  const NumberDocument.dirty(String value ) : super.dirty(value);

  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == NumberDocumentError.empty) return 'El campo es obligatorio';
    if(displayError == NumberDocumentError.length) return 'El campo debe tener al menos 6 caracteres';

    return null;
  
  }

  @override
  NumberDocumentError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return NumberDocumentError.empty;
    if(value.length < 6) return NumberDocumentError.length;

    return null;
  }
}