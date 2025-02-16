

import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/domain/repositories/repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthDatasource authDatasource;

  AuthRepositoryImpl(this.authDatasource);
  
  @override
  Future<Login> login({required String numberDocument, required String password}) {
    
    return authDatasource.login(
      numberDocument: numberDocument, 
      password: password
      );
  }

  @override
  Future<Logout> logout() {
    return authDatasource.logout();
  }

  @override
  Future<Register> register({required String email, required String typeDocument, required String numberDocument, required String password, required String passwordConfirmation, required String numberPhone, required String completeName, required String countryCode, required String dateOfBirth}) {
    return authDatasource.register(email: email, typeDocument: typeDocument, numberDocument: numberDocument, password: password, passwordConfirmation: passwordConfirmation, numberPhone: numberPhone, completeName: completeName, countryCode: countryCode, dateOfBirth: dateOfBirth);
  }

  @override
  Future<SendVerifyPhone> sendVerifyPhone({required String userId}) {
    return authDatasource.sendVerifyPhone(userId: userId);
  }

  @override
  Future<VerifyPhone> verifyPhone({required String userId, required String code}) {
    return authDatasource.verifyPhone(userId: userId, code: code);
  }

}