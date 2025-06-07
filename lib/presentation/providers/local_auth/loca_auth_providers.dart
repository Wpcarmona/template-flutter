

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_template/config/plugins/local_auth_plugin.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

enum LocalAuthStatus {authenticated, notAuthenticated, autehnticating}


 final localAuthProvider = StateNotifierProvider<LocalAuthNotifier,LocalAuthState >((ref) {
  return LocalAuthNotifier();
 });

class LocalAuthNotifier extends StateNotifier<LocalAuthState>{
  LocalAuthNotifier(): super(LocalAuthState());

  Future<(bool,String)> authtenticateUser({bool biometricOnly = false}) async {
    final (didAuthtenticate, message) = await LocalAuthPlugin.authenticate(biometricOnly:biometricOnly);

    state = state.copyWith(
      didAuthenticate: didAuthtenticate,
      message: message,
      status: didAuthtenticate ? LocalAuthStatus.authenticated : LocalAuthStatus.notAuthenticated
    );

    return (didAuthtenticate, message);

  }
  
}


class LocalAuthState {

  final bool didAuthenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState({
     this.didAuthenticate = false, 
     this.status = LocalAuthStatus.notAuthenticated, 
     this.message = ''});

  LocalAuthState copyWith({
    bool? didAuthenticate,
    LocalAuthStatus? status,
    String? message,
  }) => LocalAuthState(
      didAuthenticate: didAuthenticate ?? this.didAuthenticate,
      status: status ?? this.status,
      message: message ?? this.message,
  );

  @override
  String toString() {
    // TODO: implement toString
    return ''' 
      didAuthenticate: $didAuthenticate,
      status: $status,
      message: $message
    ''';
  }
  
}
