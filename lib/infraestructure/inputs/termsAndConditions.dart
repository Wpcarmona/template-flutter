import 'package:formz/formz.dart';

enum TermsAndConditionsError { notAccepted }

class TermsAndConditions extends FormzInput<bool, TermsAndConditionsError> {
  const TermsAndConditions.pure() : super.pure(false);
  const TermsAndConditions.dirty(bool value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == TermsAndConditionsError.notAccepted) {
      return 'Debes aceptar los términos y condiciones';
    }
    return null;
  }

  @override
  TermsAndConditionsError? validator(bool value) {
    return value ? null : TermsAndConditionsError.notAccepted;
  }
}
