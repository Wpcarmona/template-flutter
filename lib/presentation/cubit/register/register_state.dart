part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}
class RegisterFormState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final bool isStepValid;
  final Password password;
  final ConfirmPassword confirmPassword;
  final Email email;
  final Username username;
  final PhoneNumber phoneNumber;
  final TermsAndConditions termsAndConditions;

  final bool hasUpperCase;
  final bool hasMinLength;
  final bool hasSpecialCharOrNumber;
  
  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false, 
    this.isStepValid = false,
    this.password = const Password.pure(), 
    this.confirmPassword = const ConfirmPassword.pure(),
    this.email =  const Email.pure(), 
    this.username = const Username.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.termsAndConditions = const TermsAndConditions.pure(),
    this.hasUpperCase = false,
    this.hasMinLength = false,
    this.hasSpecialCharOrNumber = false,
    });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    bool? isStepValid,
    Password? password,
    ConfirmPassword? confirmPassword,
    Email? email,
    Username? username,
    PhoneNumber? phoneNumber,
    TermsAndConditions? termsAndConditions,
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
      phoneNumber: phoneNumber ?? this.phoneNumber,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      hasUpperCase: hasUpperCase ?? this.hasUpperCase,
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasSpecialCharOrNumber: hasSpecialCharOrNumber ?? this.hasSpecialCharOrNumber,
      
    );
  }

  @override
  List<Object> get props => [
    formStatus, 
    isValid, 
    isStepValid,
    password, 
    confirmPassword,
    email, 
    username, 
    phoneNumber, 
    termsAndConditions,
    hasUpperCase,
    hasMinLength,
    hasSpecialCharOrNumber,
    ];
}

