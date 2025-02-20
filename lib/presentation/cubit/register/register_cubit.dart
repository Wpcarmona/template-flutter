import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());

  void onSubmit() {
    print("onSubmit: $state");
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
        confirmPassword: ConfirmPassword.dirty(
          value: state.confirmPassword.value,
          originalPassword: state.password.value,
        ),
        username: Username.dirty(state.username.value),
        phoneNumber: PhoneNumber.dirty(state.phoneNumber.value),
        termsAndConditions:
            TermsAndConditions.dirty(state.termsAndConditions.value),
        isValid: Formz.validate([
          state.email,
          state.password,
          state.confirmPassword,
          state.username,
          state.phoneNumber,
          state.termsAndConditions
        ]),
      ),
    );
  }

  void onStepOneSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        email: Email.dirty(state.email.value),
        username: Username.dirty(state.username.value),
        phoneNumber: PhoneNumber.dirty(state.phoneNumber.value),
        termsAndConditions:
            TermsAndConditions.dirty(state.termsAndConditions.value),
        isStepValid: Formz.validate([
          state.email,
          state.username,
          state.phoneNumber,
          state.termsAndConditions,
        ]),
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate(
          [email, state.password, state.username, state.phoneNumber]),
      isStepValid: Formz.validate([email, state.username, state.phoneNumber]),
    ));
  }

 void passwordChanged(String value) {
  final password = Password.dirty(value);
  final confirmPassword = ConfirmPassword.dirty(
    value: state.confirmPassword.value,
    originalPassword: password.value,
  );

  // Verificaciones
  final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
  final hasMinLength = value.length >= 8;
  final hasSpecialCharOrNumber = RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value);

  emit(state.copyWith(
    password: password,
    confirmPassword: confirmPassword,
    hasUpperCase: hasUppercase,
    hasMinLength: hasMinLength,
    hasSpecialCharOrNumber: hasSpecialCharOrNumber,
    isValid: Formz.validate([
      password,
      confirmPassword,
      state.email,
      state.username,
      state.phoneNumber,
      state.termsAndConditions
    ]),
  ));
}


  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPassword.dirty(
      value: value,
      originalPassword: state.password.value,
    );

    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isValid: Formz.validate([
        confirmPassword,
        state.password,
        confirmPassword,
        state.email,
        state.username,
        state.phoneNumber,
        state.termsAndConditions
      ]),
    ));
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate(
          [username, state.email, state.password, state.phoneNumber]),
      isStepValid: Formz.validate([username, state.email, state.phoneNumber]),
    ));
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      isValid: Formz.validate(
          [phoneNumber, state.email, state.password, state.username]),
      isStepValid: Formz.validate([phoneNumber, state.email, state.username]),
    ));
  }

  void termsAndConditionsChanged(bool value) {
    final termsAndConditions = TermsAndConditions.dirty(value);
    emit(state.copyWith(
      termsAndConditions: termsAndConditions,
      isValid: Formz.validate(
          [termsAndConditions, state.email, state.username, state.phoneNumber]),
      isStepValid: Formz.validate(
          [termsAndConditions, state.email, state.username, state.phoneNumber]),
    ));
  }
}
