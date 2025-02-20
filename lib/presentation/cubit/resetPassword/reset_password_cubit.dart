import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordFormState> {
  ResetPasswordCubit() : super(ResetPasswordFormState());


  void onSubmit(){
    emit(
      state.copyWith(
        formStatus: FormStatus.validating, 
        email: Email.dirty(state.email.value), 
        isValid: Formz.validate([state.email])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      )
    );
  }
}
