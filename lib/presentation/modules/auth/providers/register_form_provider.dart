import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';

enum FormRegisterStatus { invalid, valid, validating, posting }

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final registerUserCallback = ref.watch(authProvider.notifier).registerUser;

  return RegisterFormNotifier(registerUserCallback: registerUserCallback);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(
    String,
    String,
    String,
    String,
    String,
    String,
  ) registerUserCallback;

  RegisterFormNotifier({required this.registerUserCallback})
      : super(RegisterFormState());

  onStepSubmit() {
    final isStepValid = Formz.validate([
      state.username,
      state.email,
      state.phoneNumber,
    ]);

    state = state.copyWith(
      formStatus:
          isStepValid ? FormRegisterStatus.valid : FormRegisterStatus.invalid,
      isStepValid: isStepValid,
    );
  }

  onFormSubmit() async {
    if (!state.isStepValid) return;
    state = state.copyWith(formStatus: FormRegisterStatus.validating);
    await registerUserCallback(
      state.username.value,
      state.countryCode.value,
      state.phoneNumber.value,
      state.email.value,
      state.password.value,
      state.confirmPassword.value,
    );
    state = state.copyWith(formStatus: FormRegisterStatus.valid);
  }

  onUsernameChanged(String value) {
    final newuserName = Username.dirty(value);
    state = state.copyWith(
      username: newuserName,
      isValid: Formz.validate([
        newuserName,
        state.email,
        state.countryCode,
        state.phoneNumber,
        state.password,
        state.confirmPassword
      ]),
      isStepValid: Formz.validate(
          [newuserName, state.countryCode, state.email, state.phoneNumber]),
    );
  }

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate([
          newEmail,
          state.username,
          state.countryCode,
          state.phoneNumber,
          state.password,
          state.confirmPassword
        ]),
        isStepValid: Formz.validate(
            [newEmail, state.username, state.countryCode, state.phoneNumber]));
  }

  onCountryCodeChanged(String value) {
    final newCountryCode = CountryCode.dirty(value);
    state = state.copyWith(
        countryCode: newCountryCode,
        isValid: Formz.validate([
          newCountryCode,
          state.email,
          state.username,
          state.phoneNumber,
          state.password,
          state.confirmPassword
        ]),
        isStepValid: Formz.validate([
          newCountryCode,
          state.email,
          state.username,
          state.phoneNumber,
        ]));
  }

  onPhoneNumberChanged(String value) {
    final newPhoneNumber = PhoneNumber.dirty(value);
    state = state.copyWith(
        phoneNumber: newPhoneNumber,
        isValid: Formz.validate([
          newPhoneNumber,
          state.email,
          state.username,
          state.countryCode,
          state.password,
          state.confirmPassword
        ]),
        isStepValid: Formz.validate(
            [newPhoneNumber, state.email, state.countryCode, state.username]));
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
        isValid: Formz.validate([
          newPassword,
          state.confirmPassword,
          state.countryCode,
          state.email,
          state.username,
          state.phoneNumber,
        ]));
  }

  onConfirmPasswordChanged(String value) {
    final newPasswordConfirmation = ConfirmPassword.dirty(
        value: value, originalPassword: state.password.value);

    state = state.copyWith(
        confirmPassword: newPasswordConfirmation,
        isValid: Formz.validate([
          newPasswordConfirmation,
          state.password,
          state.countryCode,
          state.email,
          state.username,
          state.phoneNumber,
        ]));
  }
}

class RegisterFormState {
  final FormRegisterStatus formStatus;
  final bool isValid;
  final bool isStepValid;
  final Password password;
  final ConfirmPassword confirmPassword;
  final Email email;
  final Username username;
  final CountryCode countryCode;
  final PhoneNumber phoneNumber;
  final bool hasUpperCase;
  final bool hasMinLength;
  final bool hasSpecialCharOrNumber;

  RegisterFormState({
    this.formStatus = FormRegisterStatus.invalid,
    this.isValid = false,
    this.isStepValid = false,
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.countryCode = const CountryCode.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.hasUpperCase = false,
    this.hasMinLength = false,
    this.hasSpecialCharOrNumber = false,
  });

  RegisterFormState copyWith({
    FormRegisterStatus? formStatus,
    bool? isValid,
    bool? isStepValid,
    Password? password,
    ConfirmPassword? confirmPassword,
    Email? email,
    Username? username,
    CountryCode? countryCode,
    PhoneNumber? phoneNumber,
    bool? hasUpperCase,
    bool? hasMinLength,
    bool? hasSpecialCharOrNumber,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      isStepValid: isStepValid ?? this.isStepValid,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      email: email ?? this.email,
      username: username ?? this.username,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      hasUpperCase: hasUpperCase ?? this.hasUpperCase,
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasSpecialCharOrNumber:
          hasSpecialCharOrNumber ?? this.hasSpecialCharOrNumber,
    );
  }
}
