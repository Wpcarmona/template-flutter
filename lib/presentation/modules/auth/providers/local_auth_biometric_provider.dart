import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/infraestructure/inputs/password.dart';
import 'package:formz/formz.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';

enum FormStatus { invalid, valid, validating, posting }

final localauthBiometricProvider = StateNotifierProvider.autoDispose<
    LocalauthBiometricFormNotifier, LocalauthBiometricState>((ref) {
      final loginUserCallback = ref.watch(authProvider.notifier).loginUserWithBiometrics;
      return LocalauthBiometricFormNotifier(loginUserCallback: loginUserCallback);
    });

class LocalauthBiometricFormNotifier
    extends StateNotifier<LocalauthBiometricState> {
  final Function(String) loginUserCallback;

  LocalauthBiometricFormNotifier({required this.loginUserCallback})
      : super(LocalauthBiometricState());

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword, isValid: Formz.validate([newPassword]));
  }

  onFormSubmit() async {
    if (!state.isValid) return;
    state = state.copyWith(formStatus: FormStatus.validating);
     await loginUserCallback(state.password.value);
    state = state.copyWith(formStatus: FormStatus.valid);
  }
}

class LocalauthBiometricState {
  final FormStatus formStatus;
  final bool isValid;
  final Password password;

  LocalauthBiometricState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.password = const Password.pure(),
  });

  LocalauthBiometricState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Password? password,
  }) {
    return LocalauthBiometricState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
    );
  }
}
