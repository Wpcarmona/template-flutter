import 'dart:convert';


import 'package:app_template/infraestructure/repositories/repositories_infraestructure.dart';
import 'package:app_template/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/config/config.dart';
import 'package:app_template/domain/domain.dart';
import 'package:dio/dio.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
  chekingOTp,
  chekingType
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
    ref: ref,
    authRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.ref,
    required this.authRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    try {
      final login =
          await authRepository.login(email: email, password: password);
      _setLoggedUser(login);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, authStatus: AuthStatus.notAuthenticated);
      }, ref);
    }
  }

  Future<void> loginUserWithBiometrics(String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('userInfo');
      if (userJson != null) {
        final userMap = jsonDecode(userJson);
        final email = userMap['email'];
        await authRepository.login(email: email, password: password);
        _setLoggedUserBiometric(email, password);
      }
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, authStatus: AuthStatus.notAuthenticated);
      }, ref);
    }
  }

  Future<void> loginWithBiometric() async {
    final (didAuthenticate, message) =
        await LocalAuthPlugin.authenticate(biometricOnly: true);
    try {
      if (didAuthenticate) {
        final (email, password) = await LocalAuthPlugin.getSavedCredentials();
        if (email != null && password != null) {
          await loginUser(email, password);
        }
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Ocurrio un error porfavor intentalo mas adelante',
      );
    }
  }

  Future<void> removeBiometric() async {
    try {
      await LocalAuthPlugin.clearCredentials();
      await keyValueStorageService.setKeyValue(AppKeys.biometric, false);
      state = state.copyWith(
        errorMessage: 'Se eliminaron las credenciales exitosamente',
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Ocurrio un error porfavor intentalo mas adelante',
      );
    }
  }

  Future<void> logout([String? errorMessage]) async {
    try {
      final token =
          await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      await authRepository.logout(token: token);
      await keyValueStorageService.removeKey(AppKeys.token);
      await keyValueStorageService.removeKey(AppKeys.userInfo);
      await keyValueStorageService.removeKey(AppKeys.publicUserInfo);
      ref.invalidate(participantProvider);
      ref.invalidate(achievementProvider);
      ref.invalidate(metricsProvider);
      state = state.copyWith(
          authStatus: AuthStatus.notAuthenticated,
          user: null,
          errorMessage: errorMessage);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, authStatus: AuthStatus.notAuthenticated);
      }, ref);
    }
  }

  Future<void> handleDeletedAccountOrExpirateToken() async {
    await keyValueStorageService.clearAll();
    ref.invalidate(participantProvider);
    ref.invalidate(achievementProvider);
    ref.invalidate(metricsProvider);
    state = state.copyWith(authStatus: AuthStatus.notAuthenticated, user: null);
  }

  Future<void> registerUser(String name, String countryCode, String phoneNumber,
      String email, String password, String confirmPassword) async {
    try {
      final register = await authRepository.register(
          name: name,
          email: email,
          password: password,
          passwordConfirmation: confirmPassword,
          phoneNumber: countryCode + phoneNumber);
      _setRegisterUser(register);
      // _setRegisterUser(register);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(errorMessage: message);
      }, ref);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      final resetPassword = await authRepository.resetPassword(email: email);
      _setResetPassword(resetPassword);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(errorMessage: message);
      }, ref);
    }
  }

  Future<void> updatePassword(String actualPassword, String newPassword,
      String newPasswordConfirmation) async {
    try {
      final token =
          await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token != null) {
        final updatePassword = await authRepository.updatePassword(
            token: token,
            actualPassword: actualPassword,
            newPassword: newPassword,
            newPasswordConfirmation: newPasswordConfirmation);
        _setUpdatePassword(updatePassword);
      }
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(errorMessage: message);
      }, ref);
    }
  }

  Future<void> updateUser(String token, String? name, String? phone) async {
    try {
      if (name != null) {
        final updateUser =
            await authRepository.updateUser(token: token, name: name);
        _setUpdateUser(updateUser);
      } else if (phone != null) {
        final updateUser =
            await authRepository.updateUser(token: token, phone: phone);
        _setUpdateUser(updateUser);
      } else {
        final updateUser = await authRepository.updateUser(
            token: token, name: name, phone: phone);
        _setUpdateUser(updateUser);
      }
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(errorMessage: message);
      }, ref);
    }
  }

  void setAuthStatus() {
    state = state.copyWith(authStatus: AuthStatus.authenticated);
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>(AppKeys.token);
    if (token == null) return handleDeletedAccountOrExpirateToken();
    state = state.copyWith(authStatus: AuthStatus.authenticated);
  }

  void _setLoggedUser(Login login) async {
    await keyValueStorageService.setKeyValue(AppKeys.token, login.token);
    _setInfouser(login.participant);
    await ref.read(participantProvider.notifier).getInfoPublicUser();
    state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: login.participant,
        errorMessage: '');
  }

  void _setRegisterUser(Register register) async {
    await keyValueStorageService.setKeyValue(AppKeys.token, register.token);
    _setInfouser(register.participant);
    await ref.read(participantProvider.notifier).getInfoPublicUser();
    state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: register.participant,
        errorMessage: '');
  }

  void _setInfouser(Participant participant) async {
    await keyValueStorageService.setKeyValue(
        'userInfo',
        jsonEncode({
          '_id': participant.id,
          'uid': participant.uid,
          'email': participant.email,
          'name': participant.name,
          'avatar': participant.avatar,
          'state': participant.state
        }));
  }

  void _setLoggedUserBiometric(String email, String password) async {
    final (didAuthenticate, message) =
        await LocalAuthPlugin.authenticate(biometricOnly: true);

    try {
      if (didAuthenticate) {
        await LocalAuthPlugin.saveCredentials(email, password);
        await keyValueStorageService.setKeyValue('biometric', true);
        state = state.copyWith(
          errorMessage: 'Datos biometricos guardados con exito',
        );
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Ocurrio un error porfavor intentalo mas adelante',
      );
    }
  }

  void _setResetPassword(ResetPassword resetPassword) async {
    state = state.copyWith(
      errorMessage: resetPassword.message,
    );
  }

  void _setUpdatePassword(UpdatePassword updatePassword) async {
    state = state.copyWith(
      errorMessage: 'Contraseña actualizada con exito',
    );
  }

  void _setUpdateUser(UpdateUser updateUser) {
    state = state.copyWith(
      errorMessage: 'El usuario se actualizo con exito',
    );
  }
}

class AuthState {
  final AuthStatus authStatus;
  final Participant? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    Participant? user,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
