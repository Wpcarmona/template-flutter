part of 'login_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

class LoginFormState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final Password password;
  final Email email;

  const LoginFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false, 
    this.email = const Email.pure(),
    this.password = const Password.pure() });

  LoginFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Password? password,
    Email? email
  }) {
    return LoginFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
      email: email ?? this.email
    );
  }

  @override
  List<Object> get props => [formStatus, isValid, email, password];
}

