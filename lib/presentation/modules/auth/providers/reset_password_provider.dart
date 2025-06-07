import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';

enum FormStatus { invalid, valid, validating, posting }

final resetPasswordFormProvider = StateNotifierProvider.autoDispose<
    ResetPasswordNotifier, ResetPasswordState>((ref) {
  final resetPasswordCallback = ref.watch(authProvider.notifier).resetPassword;

  return ResetPasswordNotifier(resetPasswordCallback: resetPasswordCallback);
});

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final Function(String) resetPasswordCallback;

  ResetPasswordNotifier({required this.resetPasswordCallback})
      : super(const ResetPasswordState());

  onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(email: email, isValid: Formz.validate([email]));
  }

  onFormSubmit() async {
    if (!state.isValid) return;
    state = state.copyWith(formStatus: FormStatus.validating);
    await resetPasswordCallback(state.email.value);
    state = state.copyWith(formStatus: FormStatus.valid);
  }
}

class ResetPasswordState {
  final FormStatus formStatus;
  final bool isValid;
  final Email email;

  const ResetPasswordState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.email = const Email.pure(),
  });

  ResetPasswordState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Email? email,
  }) {
    return ResetPasswordState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
    );
  }
}
