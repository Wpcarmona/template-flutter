import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';

enum FormStatus { invalid, valid, validating, posting }

final updatePasswordFormProvider = StateNotifierProvider.autoDispose<
    UpdatePasswordFormNotifier, UpdatePasswordFormState>((ref) {
      final updatePaswordCallback = ref.watch(authProvider.notifier).updatePassword;

      return UpdatePasswordFormNotifier(updatePasswordCallback: updatePaswordCallback);
  });

class UpdatePasswordFormNotifier
    extends StateNotifier<UpdatePasswordFormState> {
  final Function(String, String, String) updatePasswordCallback;

  UpdatePasswordFormNotifier({required this.updatePasswordCallback})
      : super(UpdatePasswordFormState());

  onActualPasswordChanged(String value) {
    final newActualPassword = Password.dirty(value);
    state = state.copyWith(
        actualPassword: newActualPassword,
        isValid: Formz.validate(
            [state.password, state.confirmPassword, newActualPassword]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    final hasMinLength = value.length >= 8;
    final hasSpecialCharOrNumber =
        RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value);
    state = state.copyWith(
        password: newPassword,
        hasUpperCase: hasUppercase,
        hasMinLength: hasMinLength,
        hasSpecialCharOrNumber: hasSpecialCharOrNumber,
        isValid: Formz.validate(
            [newPassword, state.confirmPassword, state.actualPassword]));
  }

  onConfirmPasswordChanged(String value) {
    final newPasswordConfirmation = ConfirmPassword.dirty(
        value: value, originalPassword: state.password.value);
    state = state.copyWith(
        confirmPassword: newPasswordConfirmation,
        isValid: Formz.validate(
            [state.password, newPasswordConfirmation, state.actualPassword]));
  }

  onFormSubmit() async {
    if (!state.isValid) return;
    state = state.copyWith(formStatus: FormStatus.validating);
    await updatePasswordCallback(state.actualPassword.value,
        state.password.value, state.confirmPassword.value);
    state = state.copyWith(formStatus: FormStatus.valid);
  }
}

class UpdatePasswordFormState {
  final FormStatus formStatus;
  final bool isValid;
  final Password actualPassword;
  final Password password;
  final ConfirmPassword confirmPassword;
  final bool hasUpperCase;
  final bool hasMinLength;
  final bool hasSpecialCharOrNumber;

  const UpdatePasswordFormState({
    this.formStatus = FormStatus.valid,
    this.isValid = false,
    this.actualPassword = const Password.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.hasUpperCase = false,
    this.hasMinLength = false,
    this.hasSpecialCharOrNumber = false,
  });

  UpdatePasswordFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Password? actualPassword,
    Password? password,
    ConfirmPassword? confirmPassword,
    bool? hasUpperCase,
    bool? hasMinLength,
    bool? hasSpecialCharOrNumber,
  }) {
    return UpdatePasswordFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      actualPassword: actualPassword ?? this.actualPassword,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      hasUpperCase: hasUpperCase ?? this.hasUpperCase,
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasSpecialCharOrNumber:
          hasSpecialCharOrNumber ?? this.hasSpecialCharOrNumber,
    );
  }
}
