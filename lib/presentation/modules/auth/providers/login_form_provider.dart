import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';

// final loginFormProvider = StateNotifierProvider.autoDispose<
enum FormStatus { invalid, valid, validating, posting }

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;

  return LoginFormNotifier(loginUserCallback: loginUserCallback);
});

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final Function(String, String) loginUserCallback;

  LoginFormNotifier({required this.loginUserCallback})
      : super(LoginFormState());

  onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email]));
  }

  onFormSubmit() async {
    if (!state.isValid) return;
    state = state.copyWith(formStatus: FormStatus.validating);
     await loginUserCallback(state.email.value, state.password.value);
    state = state.copyWith(formStatus:FormStatus.valid);
  }

  
}

class LoginFormState {
  final FormStatus formStatus;
  final bool isValid;
  final Email email;
  final Password password;

  const LoginFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  LoginFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Email? email,
    Password? password,
  }) {
    return LoginFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
