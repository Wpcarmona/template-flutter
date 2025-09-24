import 'package:app_template/domain/entities/entities.dart';

abstract class AuthDatasource {
  Future<Login> login({required String email, required String password});

  Future<Logout> logout({required String token});

  Future<Register> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
  });

  Future<SendVerifyPhone> sendVerifyPhone({required String userId});

  Future<VerifyPhone> verifyPhone(
      {required String userId, required String code});

  Future<ResetPassword> resetPassword({required String email});

  Future<UpdatePassword> updatePassword(
      {required String token,
      required String actualPassword,
      required String newPassword,
      required String newPasswordConfirmation});

  Future<UpdateUser> updateUser({
    required String token,
    String? name,
    String? phone
  });

  Future<ResetPassWordValidate> resetPassWordValidate({required String email});
}
