import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';

enum FormStatus { invalid, valid, validating, posting }

final updateUserProvider = StateNotifierProvider.autoDispose<UpdateUserFormNotifier, UpdateUserFormState>((ref) {
      final updateUserCallback = ref.watch(authProvider.notifier).updateUser;

      return UpdateUserFormNotifier(updateUserCallback: updateUserCallback);
    });

class UpdateUserFormNotifier extends StateNotifier<UpdateUserFormState> {
  final Function(String, String, String) updateUserCallback;

  UpdateUserFormNotifier({
    required this.updateUserCallback,
  }) : super(UpdateUserFormState());

  onUsernameChanged(String value) {
    final username = Username.dirty(value);
    state = state.copyWith(
      username: username,
      isValidName: Formz.validate([username]),
    );
  }

  onPhoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    state = state.copyWith(
      phoneNumber: phoneNumber,
      isValidPhone: Formz.validate([phoneNumber]),
    );
  }

  onSubmit() {
    if (!state.isValidName || !state.isValidPhone) return;
    state = state.copyWith(formStatus: FormStatus.validating);
    updateUserCallback(state.username.value, state.phoneNumber.value,
        state.formStatus.toString());
    state = state.copyWith(formStatus: FormStatus.valid);
  }
}

class UpdateUserFormState {
  final FormStatus formStatus;
  final bool isValidName;
  final bool isValidPhone;
  final Username username;
  final PhoneNumber phoneNumber;

  UpdateUserFormState({
    this.formStatus = FormStatus.valid,
    this.isValidName = false,
    this.isValidPhone = false,
    this.phoneNumber = const PhoneNumber.pure(),
    this.username = const Username.pure(),
  });

  UpdateUserFormState copyWith({
    FormStatus? formStatus,
    bool? isValidName,
    bool? isValidPhone,
    PhoneNumber? phoneNumber,
    Username? username,
  }) {
    return UpdateUserFormState(
      formStatus: formStatus ?? this.formStatus,
      isValidName: isValidName ?? this.isValidName,
      isValidPhone: isValidPhone ?? this.isValidPhone,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      username: username ?? this.username,
    );
  }
}
