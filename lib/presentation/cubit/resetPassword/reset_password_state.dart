part of 'reset_password_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}
class ResetPasswordFormState extends Equatable {

  final FormStatus formStatus;
  final Email email;
  final bool isValid;

  const ResetPasswordFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false,
    this.email = const Email.pure(),
  });

  ResetPasswordFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Email? email,
  }) {
    return ResetPasswordFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [formStatus, isValid, email];
}

