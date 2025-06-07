import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();
  static final FlutterSecureStorage secureStorage =
      const FlutterSecureStorage();

  static Future<bool> canCheckBiometrics() async {
    try {
      bool canCheck = await auth.canCheckBiometrics;
      bool isDeviceSupported = await auth.isDeviceSupported();
      return canCheck && isDeviceSupported;
    } catch (e) {
      print('Error verificando biometría: $e');
      return false;
    }
  }

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await auth.getAvailableBiometrics();
    } catch (e) {
      print('Error obteniendo biometría disponible: $e');
      return [];
    }
  }

  static Future<(bool, String)> authenticate({bool biometricOnly = false}) async {
    try {
      bool canAuthenticate = await canCheckBiometrics();
      if (!canAuthenticate) {
        return (false, 'Biometría no disponible en este dispositivo');
      }

      final bool didAuthenticate = await auth.authenticate(
        
        localizedReason: 'Por favor autentícate para continuar',
        options: AuthenticationOptions(
          biometricOnly: biometricOnly,
          stickyAuth: true, // Permite reautenticación sin cerrar la app
        ),
      );

      return (
        didAuthenticate,
        didAuthenticate ? 'Hecho' : 'Cancelado por el usuario'
      );
    } on PlatformException catch (e) {
      print('Error en autenticación: ${e.code} - ${e.message}');

      if (e.code == auth_error.notEnrolled)
        return (false, 'No hay biométricos registrados');
      if (e.code == auth_error.lockedOut)
        return (false, 'Muchos intentos fallidos');
      if (e.code == auth_error.notAvailable)
        return (false, 'No hay biométricos disponibles');
      if (e.code == auth_error.passcodeNotSet)
        return (false, 'No hay un PIN configurado');
      if (e.code == auth_error.permanentlyLockedOut)
        return (false, 'Se requiere desbloquear el teléfono');

      return (false, 'Error desconocido: ${e.message}');
    }
  }

  static Future<void> saveCredentials(String email, String password) async {
    await secureStorage.write(key: 'email', value: email);
    await secureStorage.write(key: 'password', value: password);
  }

  static Future<(String?, String?)> getSavedCredentials() async {
    final String? email = await secureStorage.read(key: 'email');
    final String? password = await secureStorage.read(key: 'password');
    return (email, password);
  }

  static Future<void> clearCredentials() async {
    await secureStorage.delete(key: 'email');
    await secureStorage.delete(key: 'password');
  }
}
