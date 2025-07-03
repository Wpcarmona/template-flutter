import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/domain/repositories/repository.dart';
import 'package:app_template/infraestructure/datasources/auth_datasource/auth_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl([AuthDatasource? authDatasource])
      : authDatasource = authDatasource ?? AuthSPDatasource();

  @override
  Future<Login> login({required String email, required String password}) {
    return authDatasource.login(email: email, password: password);
  }

  @override
  Future<Logout> logout({required String token}) {
    return authDatasource.logout(token: token);
  }

  @override
  Future<Register> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
  }) {
    return authDatasource.register(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  @override
  Future<SendVerifyPhone> sendVerifyPhone({required String userId}) {
    return authDatasource.sendVerifyPhone(userId: userId);
  }

  @override
  Future<VerifyPhone> verifyPhone(
      {required String userId, required String code}) {
    return authDatasource.verifyPhone(userId: userId, code: code);
  }

  @override
  Future<ResetPassword> resetPassword({required String email}) {
    return authDatasource.resetPassword(email: email);
  }

  @override
  Future<UpdatePassword> updatePassword(
      {required String token,
      required String actualPassword,
      required String newPassword,
      required String newPasswordConfirmation}) {
    return authDatasource.updatePassword(
        token: token,
        actualPassword: actualPassword,
        newPassword: newPassword,
        newPasswordConfirmation: newPasswordConfirmation);
  }
  
  @override
  Future<UpdateUser> updateUser({required String token, String? name, String? phone}) {
    return authDatasource.updateUser(token: token, name: name, phone: phone);
  }
  
  
}
